import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mental_health_app/core/ads_helper.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/get_doctor/domain/entities/doctor.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:hexcolor/hexcolor.dart';

void doctorBottomSheet(BuildContext context,
    {required DoctorEntities getDoctor}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      // This allows the sheet to take up more space if needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return GetDoctorBottomSheet(
          doctor: getDoctor,
        );
      });
}

class GetDoctorBottomSheet extends StatefulWidget {
  final DoctorEntities doctor;

  const GetDoctorBottomSheet({super.key, required this.doctor});

  @override
  State<GetDoctorBottomSheet> createState() => _GetDoctorBottomSheetState();
}

class _GetDoctorBottomSheetState extends State<GetDoctorBottomSheet> {
  // for make banner
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
    _createBannerAd();
    super.initState();
  }

  // this for choice the color
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
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (_, controller) => Container(
        color: DefaultColors.white,
        padding: const EdgeInsets.all(16),
        child: ListView(
          controller: controller,
          children: [
            AppBar(
              backgroundColor: DefaultColors.white,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Image.asset(
                  'assets/images/down_arrow.png',
                ),
              ),
            ),
            Column(
              children: [
                // Using Wrap makes the height dynamic
                Wrap(
                  children: [
                    // photo
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: widget.doctor.doctorPhoto,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) {
                              return SizedBox(
                                height: 200.0,
                                width: 200.0,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: DefaultColors.pink,
                                  ),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) =>
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
                              fallback: (context) => Container(),
                            ),
                          ),
                        ),
                        // persint similarity
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: DefaultColors.purple,
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(
                                '${widget.doctor.percentSimilarity}',
                                style: TextStyle(
                                  color: DefaultColors.purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // title for section
                    AutoSizeText(
                      widget.doctor.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // name
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(Icons.account_circle),
                            AutoSizeText(
                              'name : ${widget.doctor.doctorName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        // time
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(Icons.access_time),
                            AutoSizeText(
                              'Time : ${widget.doctor.timeClass}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        // date
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(Icons.date_range),
                            AutoSizeText(
                              'In date : ${widget.doctor.dateClass}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        // place doctor
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Icon(
                              Icons.map,
                            ),
                            AutoSizeText(
                              'Place : ${widget.doctor.place}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: Colors.black),
                            ),
                          ],
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
                          fallback: (context) => Container(),
                        ),
                        // medical specialty
                        FittedBox(
                          child: Chip(
                            elevation: 0,
                            shape: StadiumBorder(
                                side: BorderSide(color: Colors.transparent)),
                            backgroundColor:
                                choiceColor(widget.doctor.colorDoctorSpecialty),
                            label: Text(
                              widget.doctor.medicalSpecialty,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
