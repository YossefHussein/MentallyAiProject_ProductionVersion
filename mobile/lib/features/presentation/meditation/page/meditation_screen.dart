import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health_app/core/notification_handler.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_state.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_state.dart';
import 'package:mental_health_app/features/presentation/meditation/data/chart_mode/data_helper.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/custom_mood_bottomsheet.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/drawer_widget.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/feeling_button.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/task_card.dart';
import 'package:mental_health_app/translations/locale_keys.dart';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mental_health_app/core/ads_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class MeditationScreen extends StatefulWidget {
  MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // if user login with email make icon in circle avatar
  // if login with google set profile photo of google email in circle avatar
  Widget profilePic() {
    if (FirebaseAuth.instance.currentUser?.photoURL == null) {
      return CircleAvatar(
        child: Icon(Icons.account_circle),
      );
    } else {
      return CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
            FirebaseAuth.instance.currentUser!.photoURL!),
      );
    }
  }

  late DataBaseHelper dbHelper;
  late int count;

  int getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  NotificationHandler notificationHandler = NotificationHandler();

  BannerAd? _banner;

  // this method to adding setting
  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.leaderboard,
      adUnitId: AdHelper.bannerAdUnitId!,
      listener: AdHelper.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  void initState() {
    count = 1;
    dbHelper = DataBaseHelper.instance;
    notificationHandler.initializeNotification();
    // config of ads
    _createBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Meditation'),
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(
            'assets/images/menu_burger.png',
            color: Theme.of(context).focusColor,
          ),
        ),
        actions: [
          profilePic(),
          SizedBox(
            width: 16,
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AutoSizeText(
                //
                '${LocaleKeys.home_screen_welcome_back.tr()} ${FirebaseAuth.instance.currentUser?.displayName ?? ''}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 25,
              ),
              AutoSizeText(
                LocaleKeys.home_screen_how_are_you_feeling_today.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 16,
              ),
              // mode button
              BlocConsumer<MoodMessageBloc, MoodMessageState>(
                listener: (context, state) async {
                  if (state is MoodMessageLoadedState) {
                    // ask to get permission
                    await Permission.notification.isDenied.then((value) {
                      if (value) {
                        Permission.notification.request();
                        // send notification
                        notificationHandler
                            .showNormalNotification(state.moodMessage.text);
                      }
                    });
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        FeelingButton(
                            label:
                                LocaleKeys.home_screen_happy_mood_button.tr(),
                            image: 'assets/images/happy.png',
                            color: DefaultColors.pink,
                            onTap: () async {
                              // adding to database
                              dbHelper.add(
                                ChartModeDataModel(
                                  happyXValueNum: count,
                                  happyYValueNum: getRandomInt(10, 20),
                                ),
                              );
                              chartModeData = await dbHelper.getDatabase();
                              // Check if currentState is not null before calling setState
                              chartKey.currentState?.setState(() {});
                              count++;
                              // perss click
                              SystemSound.play(SystemSoundType.click);
                              // loading
                              sendMSG(
                                'Loadding message \n mode will be adding to database',
                              ); // call notification
                              context.read<MoodMessageBloc>().add(
                                  FetchMoodMessageEvent('Today i am happy'));
                            }),
                        FeelingButton(
                            label: LocaleKeys.home_screen_calm_mood_button.tr(),
                            image: 'assets/images/calm.png',
                            color: DefaultColors.purple,
                            onTap: () async {
                              dbHelper.add(
                                ChartModeDataModel(
                                  calmXValueNum: count,
                                  clamYValueNum: getRandomInt(10, 20),
                                ),
                              );
                              chartModeData = await dbHelper.getDatabase();
                              chartKey.currentState?.setState(() {});
                              count++; // perss click
                              SystemSound.play(SystemSoundType.click);
                              sendMSG(
                                'Loadding message \n mode will be adding to database',
                              );
                              context.read<MoodMessageBloc>().add(
                                  FetchMoodMessageEvent('Today i am calm'));
                            }),
                        FeelingButton(
                            label:
                                LocaleKeys.home_screen_relax_mood_button.tr(),
                            image: 'assets/images/relax.png',
                            color: DefaultColors.orange,
                            onTap: () async {
                              dbHelper.add(
                                ChartModeDataModel(
                                  relaxXValueNum: count,
                                  relaxYValueNum: getRandomInt(10, 20),
                                ),
                              );
                              chartModeData = await dbHelper.getDatabase();
                              chartKey.currentState?.setState(() {});
                              count++; // perss click
                              SystemSound.play(SystemSoundType.click);
                              sendMSG(
                                'Loadding message \n mode will be adding to database',
                              );
                              context.read<MoodMessageBloc>().add(
                                  FetchMoodMessageEvent('Today i am relax'));
                            }),
                        FeelingButton(
                            label:
                                LocaleKeys.home_screen_focus_mood_button.tr(),
                            image: 'assets/images/focus.png',
                            color: DefaultColors.lightTeal,
                            onTap: () async {
                              dbHelper.add(
                                ChartModeDataModel(
                                  focusXValueNum: count,
                                  focusYValueNum: getRandomInt(10, 20),
                                ),
                              );
                              chartModeData = await dbHelper.getDatabase();
                              chartKey.currentState?.setState(() {});
                              count++;
                              // perss click
                              SystemSound.play(SystemSoundType.click);
                              sendMSG(
                                'Loadding message \n mode will be adding to database',
                              );
                              context.read<MoodMessageBloc>().add(
                                    FetchMoodMessageEvent(
                                        'Today i need to be focus'),
                                  );
                            }),
                        FeelingButton(
                          label: LocaleKeys.home_screen_my_mood_button.tr(),
                          image: 'assets/images/custom_mood3.png',
                          color: DefaultColors.white,
                          onTap: () {
                            // perss click
                            SystemSound.play(SystemSoundType.click);
                            // open chart mode bottom sheet
                            customMoodBottomSheet(context);
                          },
                          borderColor: Colors.black,
                        ),
                      ],
                    ),
                  );
                },
              ),
              ConditionalBuilder(
                condition: _banner != null,
                builder: (context) => Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: _banner!.size.width.toDouble(),
                    height: _banner!.size.height.toDouble(),
                    child: AdWidget(ad: _banner!),
                  ),
                ),
                fallback: (context) => Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: _banner!.size.width.toDouble(),
                    height: _banner!.size.height.toDouble(),
                    child: AdWidget(ad: _banner!),
                  ),
                ),
              ),
              AutoSizeText(
                LocaleKeys.home_screen_today_task.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 16,
              ),
              // daily quotes
              BlocBuilder<DailyQuotesBloc, DailyQuotesState>(
                builder: (context, state) {
                  if (state is DailyQuoteLoading) {
                    return Center(
                      child:
                          CircularProgressIndicator(color: DefaultColors.pink),
                    );
                  } else if (state is DailyQuoteLoadedState) {
                    return Column(
                      children: [
                        // tasks card
                        TaskCard(
                          title: LocaleKeys.home_screen_morning.tr(),
                          description: state.dailyQuote.morningQuote,
                          color: Brightness.light == true
                              ? DefaultColors.task1
                              : DefaultColors.taskDark1,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TaskCard(
                          title: LocaleKeys.home_screen_noon.tr(),
                          description: state.dailyQuote.noonQuote,
                          color: Brightness.light == true
                              ? DefaultColors.task2
                              : DefaultColors.taskDark2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TaskCard(
                          title: LocaleKeys.home_screen_evening.tr(),
                          description: state.dailyQuote.eveningQuote,
                          color: Brightness.light == true
                              ? DefaultColors.task3
                              : DefaultColors.taskDark3,
                        )
                      ],
                    );
                  } else if (state is DailyQuoteErrorState) {
                    return Center(
                      child: AutoSizeText(
                        state.message,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  } else {
                    // if no data found
                    return Center(
                      child: AutoSizeText(
                        LocaleKeys.no_data_found.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    );
                  }
                },
              ),
              // advice message
              BlocBuilder<MoodMessageBloc, MoodMessageState>(
                builder: (context, state) {
                  if (state is MoodMessageLoadedState) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'My advice for you',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            content: Text(
                              state.moodMessage.text,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context
                                      .read<MoodMessageBloc>()
                                      .add(ResetMoodMessage());
                                },
                                child: Text(
                                  LocaleKeys.home_screen_okay_button.tr(),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
