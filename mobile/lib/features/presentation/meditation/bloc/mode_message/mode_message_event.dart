abstract class ModeMessageEvent {}

// get the message of mood
class FetchMoodMessageEvent extends ModeMessageEvent {
  final mood;

  FetchMoodMessageEvent(this.mood);
}

class ResetMoodMessage extends ModeMessageEvent {}
