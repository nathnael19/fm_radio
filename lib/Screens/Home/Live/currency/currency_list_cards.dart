import 'package:ethio_fm_radio/Screens/Home/Live/currency/currency_service.dart';
import 'package:flutter/material.dart'; // Import the service

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
    fetchRates();
  }

  Future<void> fetchRates() async {
    for (var currency in currencyInfo) {
      final code = currency[1];
      final rate = await CurrencyService.getETBRate(code);
      setState(() {
        rates[code] = rate ?? -1;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
        ),
      ],
    );
  }
}
