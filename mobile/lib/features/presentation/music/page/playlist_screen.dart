import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_bloc.dart';
import 'package:mental_health_app/features/presentation/music/bloc/song_state.dart';
import 'package:mental_health_app/features/presentation/music/widgets/songs_bottom_sheet.dart';
import 'package:mental_health_app/translations/locale_keys.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  Color? choiceColor(String typeColor) {
    Color? color;
    switch (typeColor) {
      case 'red':
        color = DefaultColors.pink;
        break;
      case 'blue':
        color = DefaultColors.purple;
        break;
      case 'orange':
        color = DefaultColors.orange;
      case 'green':
        color = DefaultColors.lightTeal;
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Songs PlayList',
          style: GoogleFonts.alegreyaSans(
            fontSize: FontSizes.doubleExtraLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            // display a loader
            return const LinearProgressIndicator(
              color: DefaultColors.pink,
            );
          } else if (state is SongLoaded) {
            // display all the information
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage: CachedNetworkImageProvider(
                            scale: 1,
                            state.songs[index].thumbnail,
                          ),
                        ),
                        title: AutoSizeText(
                          state.songs[index].title,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AutoSizeText(
                              state.songs[index].author,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: FontSizes.extraSmall),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              child: Chip(
                                elevation: 0,
                                shape: StadiumBorder(
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                backgroundColor: choiceColor(
                                    state.songs[index].colorTypeOfSong),
                                label: Text(
                                  state.songs[index].typeSong,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ), //Text
                          ],
                        ),
                        onTap: () {
                          SystemSound.play(SystemSoundType.click);
                          songBottomSheet(
                            context,
                            songs: state.songs[index],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is SongError) {
            // display an error
            return Center(
              child: AutoSizeText(
                state.message.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: AutoSizeText(
                LocaleKeys.no_data_found.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
    );
  }
}
