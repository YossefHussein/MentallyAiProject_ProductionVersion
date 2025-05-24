import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_event.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/daily_quotes/daily_quotes_state.dart';
import 'package:mental_health_app/features/presentation/meditation/domain/usecase/get_daily_quote.dart';

class DailyQuotesBloc extends Bloc<DailyQuotesEvent, DailyQuotesState> {
  final GetDailyQuote getDailyQuote;

  DailyQuotesBloc({required this.getDailyQuote})
      : super(DailyQuoteInitialState()) {
    on<FetchDailyQuoteEvent>((event, emit) async {
      emit(DailyQuoteLoading());
      try {
        final dailyQuote = await getDailyQuote();
        emit(DailyQuoteLoadedState(dailyQuote: dailyQuote));
      } catch (error) {
        emit(DailyQuoteErrorState(message: error.toString()));
      }
    });
  }
}
