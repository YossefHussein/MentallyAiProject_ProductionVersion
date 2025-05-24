import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio_cache/just_audio_cache.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mental_health_app/core/ads_helper.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/music/domain/entities/song.dart';

void songBottomSheet(BuildContext context, {required Song songs}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: false,
    // isDismissible: false,
    // This allows the sheet to take up more space if needed
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SongsBottomSheet(
        songs: songs,
      );
    },
  );
}

class SongsBottomSheet extends StatefulWidget {
  final Song songs;

  const SongsBottomSheet({super.key, required this.songs});

  @override
  State<SongsBottomSheet> createState() => _SongsBottomSheetState();
}

class _SongsBottomSheetState extends State<SongsBottomSheet> {
  // music
  late AudioPlayer _audioPlayer;
  bool isLooping = false;
  // for caching
  PlayerState? _state;

  // play and close music
  Future<void> togglePlayerPause() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  // move to bake
  Future<void> seekBackward() async {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 5);
    _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  //  move to forward
  Future<void> seekForward() async {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 5);
    _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  // make looping to music
  Future<void> toggleLoop() async {
    setState(() {
      isLooping = !isLooping;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  // to restart music from zero
  Future<void> seekRestart() async {
    _audioPlayer.seek(Duration.zero);
  }

/**
 * ads section 
 **/

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
    super.initState();
    // for initializing the music
    _audioPlayer = AudioPlayer();
    // to set urk of music and save
    _audioPlayer.dynamicSet(
      url: widget.songs.songLink,
    );
    // for auto start the music
    _audioPlayer.play();
    // to monitor the state
    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        _state = state;
      });
      print(state);
    });
    _createBannerAd();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    // _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (_, controller) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ListView(
          controller: controller,
          children: [
            // Using Wrap makes the height dynamic
            Wrap(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  // Ensures the column takes only the necessary space
                  children: [
                    AppBar(
                      backgroundColor: DefaultColors.white,
                      leading: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Image.asset('assets/images/down_arrow.png'),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon:
                              Image.asset('assets/images/transcript_icon.png'),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.songs.thumbnail,
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
                          fallback: (context) => Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: _banner!.size.width.toDouble(),
                              height: _banner!.size.height.toDouble(),
                              child: AdWidget(ad: _banner!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AutoSizeText(
                      widget.songs.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.black),
                    ),
                    AutoSizeText(
                      'By : ${widget.songs.author}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.black),
                    ),
                    // progressbar
                    StreamBuilder(
                        stream: _audioPlayer.positionStream,
                        builder: (context, snapshot) {
                          final position = snapshot.data ?? Duration.zero;
                          final total = _audioPlayer.duration ?? Duration.zero;
                          return ProgressBar(
                            progress: position,
                            total: total,
                            baseBarColor: DefaultColors.lightPink,
                            thumbColor: DefaultColors.pink,
                            progressBarColor: DefaultColors.pink,
                            onSeek: (duration) {
                              _audioPlayer.seek(duration);
                            },
                            timeLabelTextStyle: GoogleFonts.alegreyaSans(
                              fontSize: FontSizes.large,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shuffle,
                            color: DefaultColors.pink,
                          ),
                        ),
                        IconButton(
                          onPressed: seekBackward,
                          icon: const Icon(
                            Icons.skip_previous,
                            color: DefaultColors.pink,
                          ),
                        ),
                        StreamBuilder(
                          stream: _audioPlayer.playerStateStream,
                          builder: (context, snapshot) {
                            final playerState = snapshot.data;
                            final processingState =
                                playerState?.processingState ??
                                    ProcessingState.idle;
                            final playing = playerState?.playing ?? false;
                            if (processingState == ProcessingState.loading ||
                                processingState == ProcessingState.buffering) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                width: 50,
                                height: 50,
                                child: const CircularProgressIndicator(
                                  color: DefaultColors.pink,
                                ),
                              );
                            } else if (!playing) {
                              return IconButton(
                                iconSize: 80,
                                onPressed: togglePlayerPause,
                                icon: const Icon(
                                  Icons.play_circle_filled,
                                  color: DefaultColors.pink,
                                ),
                              );
                            } else if (processingState !=
                                ProcessingState.completed) {
                              return IconButton(
                                iconSize: 80,
                                onPressed: togglePlayerPause,
                                icon: const Icon(
                                  Icons.pause_circle_filled,
                                  color: DefaultColors.pink,
                                ),
                              );
                            } else {
                              return IconButton(
                                iconSize: 80,
                                onPressed: seekRestart,
                                icon: const Icon(
                                  Icons.replay_circle_filled,
                                  color: DefaultColors.pink,
                                ),
                              );
                            }
                          },
                        ),
                        IconButton(
                          onPressed: seekForward,
                          icon: const Icon(
                            Icons.skip_next,
                            color: DefaultColors.pink,
                          ),
                        ),
                        IconButton(
                          onPressed: toggleLoop,
                          icon: Icon(
                            isLooping ? Icons.repeat_one : Icons.repeat,
                            color: DefaultColors.pink,
                          ),
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
                      fallback: (context) => Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: _banner!.size.width.toDouble(),
                          height: _banner!.size.height.toDouble(),
                          child: AdWidget(ad: _banner!),
                        ),
                      ),
                    ),
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
