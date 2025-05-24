import 'package:mental_health_app/features/presentation/meditation/domain/entities/daily_quotes.dart';

abstract class DailyQuotesState {}

class DailyQuoteInitialState extends DailyQuotesState {}

class DailyQuoteLoading extends DailyQuoteInitialState {}

class DailyQuoteLoadedState extends DailyQuotesState {
  final DailyQuote dailyQuote;

  DailyQuoteLoadedState({required this.dailyQuote});
}

class DailyQuoteErrorState extends DailyQuotesState {
  final String message;
  DailyQuoteErrorState({required this.message});
}
