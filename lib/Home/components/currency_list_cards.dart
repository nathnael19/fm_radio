import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyListCards extends StatefulWidget {
  const CurrencyListCards({super.key});

  @override
  State<CurrencyListCards> createState() => _CurrencyListCardsState();
}

class _CurrencyListCardsState extends State<CurrencyListCards> {
  Map<String, double> rates = {};
  bool isLoading = true;

  final List<List<String>> currencyInfo = [
    ['assets/images/usa.png', 'USD', 'United States Dollar'],
    ['assets/images/europe.png', 'EUR', 'Euro'],
    ['assets/images/uk.png', 'GBP', 'British Pound'],
    ['assets/images/safrica.png', 'ZAR', 'South African Rand'],
    ['assets/images/arab.png', 'AED', 'UAE Dirham'],
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    for (var currency in currencyInfo) {
      final code = currency[1];
      final response = await http.get(
        Uri.parse(
          'https://v6.exchangerate-api.com/v6/4deebf1b88d7f727dd29ae08/latest/$code',
        ),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          rates[code] = data["conversion_rates"]["ETB"];
        });
      } else {
        setState(() {
          rates[code] = -1;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: currencyInfo.length,
              itemBuilder: (context, index) {
                final icon = currencyInfo[index][0];
                final code = currencyInfo[index][1];
                final name = currencyInfo[index][2];
                final rate = rates[code];

                return ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    width: 65,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(icon),
                      ),
                    ),
                  ),
                  title: Text(code),
                  subtitle: Text(name),
                  trailing: Text(
                    rate == null
                        ? "Loading..."
                        : rate == -1
                        ? "Error"
                        : "${rate.toStringAsFixed(2)} ብር",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
