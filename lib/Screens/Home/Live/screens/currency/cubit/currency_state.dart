import 'package:ethio_fm_radio/Screens/Home/Live/screens/currency/model/currency_model.dart';

abstract class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyFailed extends CurrencyState {
  final String msg;

  CurrencyFailed({required this.msg});
}

final class CurrencyLoaded extends CurrencyState {
  List<CurrencyModel> currency;

  CurrencyLoaded({required this.currency});
}
