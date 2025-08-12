import 'package:ethio_fm_radio/Screens/Home/Live/currency/cubit/currency_state.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/currency/model/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepository currencyRepository;
  CurrencyCubit(this.currencyRepository) : super(CurrencyInitial());

  Future<void> getCurrency(List<String> currency) async {
    try {
      emit(CurrencyLoading());
      final currencyList = await currencyRepository.getCurrencies(currency);

      emit(CurrencyLoaded(currency: currencyList));
    } catch (e) {
      emit(CurrencyFailed(msg: e.toString()));
    }
  }
}
