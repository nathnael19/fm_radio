// lib/services/currency_service.dart
import 'package:ethio_fm_radio/Screens/Home/Live/screens/currency/model/currency_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyRepository {
  Future<List<CurrencyModel>> getCurrencies(List<String> currencyCode) async {
    List<CurrencyModel> currencyList = [];

    for (String currencyy in currencyCode) {
      final url =
          'https://v6.exchangerate-api.com/v6/4deebf1b88d7f727dd29ae08/latest/$currencyy';

      try {
        final result = await http.get(Uri.parse(url));
        if (result.statusCode == 200) {
          final currencyData = jsonDecode(result.body);
          currencyList.add(
            CurrencyModel(
              imageUrl: currencyCode[0],
              title: currencyCode[1],
              subtitle: currencyCode[2],
              money: currencyData['conversion_rates']['ETB']?.toDouble(),
            ),
          );
        } else {
          currencyList.add(
            CurrencyModel(
              imageUrl: '',
              title: '',
              subtitle: '',
              money: 0,
              hasError: true,
            ),
          );
        }
      } catch (e) {
        currencyList.add(
          CurrencyModel(
            imageUrl: '',
            title: '',
            subtitle: '',
            money: 0,
            hasError: true,
          ),
        );
      }
    }

    return currencyList;
  }
}
