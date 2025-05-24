abstract class NavigationEvent {}

class NavigateToEvent extends NavigationEvent {
  final int index;
  NavigateToEvent({required this.index});
}
