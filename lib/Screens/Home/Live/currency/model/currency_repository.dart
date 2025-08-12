// lib/services/currency_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyRepository {
  Future<double?> getETBRate(String currencyCode) async {
    final url =
        'https://v6.exchangerate-api.com/v6/4deebf1b88d7f727dd29ae08/latest/$currencyCode';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["conversion_rates"]["ETB"]?.toDouble();
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Error fetching $currencyCode → ETB: $e");
    }
  }
}
