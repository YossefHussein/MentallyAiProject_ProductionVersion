import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;

  final ValueChanged<int>? onTap;

  const BottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      /**
       * The add() method sends an event to the Bloc. In this case, the event being added is NavigateTo,
       * which is a class (or event) that likely
       * takes an index as a parameter to determine where to navigate.*/
      onTap: onTap,
    );
  }
}
