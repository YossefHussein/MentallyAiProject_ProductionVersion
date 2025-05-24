import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mental_health_app/core/routes.dart';
// import 'package:mental_health_app/features/presentation/chat_gemini/chat_with_gemini.dart';
import 'package:mental_health_app/features/presentation/get_doctor/page/get_doctor.dart';
import 'package:mental_health_app/features/presentation/meditation/page/meditation_screen.dart';
import 'package:mental_health_app/features/presentation/music/page/playlist_screen.dart';
import 'package:mental_health_app/generated/assets.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_bloc.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_events.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_states.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/widget/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

//  list to contain the pages
  final List<Widget> pages = [
    MeditationScreen(),
    const PlaylistScreen(),
    // const ChatWithGeminiScreen(),
    const GetDoctorScreen(),
  ];

  //  this to adding active color
  BottomNavigationBarItem createBottomNavigationBarItem({
    String assetName = '',
    String assetSvgName = '',
    bool isSvg = false,
    required String navTooltip,
    required bool isActive,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      tooltip: navTooltip,
      icon: isSvg == false
          ? Image.asset(
              assetName,
              // this to change color of icon when the user
              // click on button nav bar
              color: isActive
                  ? Theme.of(context).focusColor
                  : Theme.of(context).primaryColor,
            )
          : SvgPicture.asset(
              assetSvgName,
              height: 35,
              width: 30,
              // this to change color of icon when the user
              // click on button nav bar
              // ignore: deprecated_member_use
              color: isActive
                  ? Theme.of(context).focusColor
                  : Theme.of(context).primaryColor,
            ),
      label: '',
    );
  }

  // current screen
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          // if state in [NavigationChanged]
          if (state is NavigationChanged) {
            currentIndex = state.index;
            return pages[currentIndex];
          }
          return pages[currentIndex];
        },
      ),
      // adding bloc builder to
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          //  when state in [NavigationChanged] change the index
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }
          List<BottomNavigationBarItem> bottomNavBarItem(context) {
            return [
              createBottomNavigationBarItem(
                assetName: 'assets/images/menu_home.png',
                navTooltip: 'menu home',
                // when use this trick you not assign
                // int to bool but you like ask compiler if [currentIndex]
                // equal zero  convert to true if not that change the color of song button [primaryColor]
                isActive: currentIndex == 0,
                context: context,
              ),
              createBottomNavigationBarItem(
                assetName: 'assets/images/menu_songs.png',
                navTooltip: 'menu songs',
                isActive: currentIndex == 1,
                context: context,
              ),
              // createBottomNavigationBarItem(
              //   isSvg: true,
              //   assetSvgName: 'assets/google_gemini_icon.svg',
              //   navTooltip: 'chat with me',
              //   isActive: currentIndex == 2,
              //   context: context,
              // ),
              createBottomNavigationBarItem(
                assetName: 'assets/images/menu_teams.png',
                navTooltip: 'get doctor',
                isActive: currentIndex == 2,
                context: context,
              ),
            ];
          }

          return BottomNavBar(
            items: bottomNavBarItem(context),
            currentIndex: currentIndex,
            onTap: (index) {
              context.go(_getRouteName(index));
              context.read<NavigationBloc>().add(NavigateToEvent(index: index));
            },
          );
        },
      ),
    );
  }

  String _getRouteName(int index) {
    switch (index) {
      case 0:
        return Routes.meditationScreenRoute;
      case 1:
        return Routes.playlistScreenRoute;
      // case 2:
      //   return Routes.chatWithGeminiScreenRoute;
      case 2:
        return Routes.getDoctorScreenRoute;
      default:
        return Routes.meditationScreenRoute;
    }
  }
}
