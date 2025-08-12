import 'package:ethio_fm_radio/Screens/Home/Live/currency/cubit/currency_state.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/currency/model/currency_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial());

  Future<void> getCurrency(String currency) async {
    CurrencyRepository currencyRepository = CurrencyRepository();

    try {
      emit(CurrencyLoading());
      final currencyList = await currencyRepository.getETBRate(currency);

      // emit(CurrencyLoaded(currency: currency));
    } catch (e) {
      emit(CurrencyFailed(msg: e.toString()));
    }
  }
}
