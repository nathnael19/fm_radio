import 'package:ethio_fm_radio/Screens/Home/Live/screens/currency/cubit/currency_cubit.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/screens/currency/cubit/currency_state.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/screens/currency/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the service

class CurrencyListCards extends StatefulWidget {
  const CurrencyListCards({super.key});

  @override
  State<CurrencyListCards> createState() => _CurrencyListCardsState();
}

class _CurrencyListCardsState extends State<CurrencyListCards> {
  final List<List<String>> currencyInfo = [
    ['assets/images/usa.png', 'United States Dollar'],
    ['assets/images/europe.png', 'Euro'],
    ['assets/images/uk.png', 'British Pound'],
    ['assets/images/safrica.png', 'South African Rand'],
    ['assets/images/arab.png', 'UAE Dirham'],
  ];

  final List<String> currencyCode = ["USD", "EUR", "GBP", "ZAR", "AED"];

  @override
  void initState() {
    super.initState();
    context.read<CurrencyCubit>().getCurrency(currencyCode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CurrencyLoaded) {
          final List<CurrencyModel> currencyList = state.currency;
          return Expanded(
            child: ListView.builder(
              itemCount: currencyList.length,
              itemBuilder: (context, index) {
                final currency = currencyList[index];
                return ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(currencyInfo[index][0]),
                      ),
                    ),
                  ),
                  title: Text(currency.title),
                  subtitle: Text(currencyInfo[index][1]),
                  trailing: currency.hasError
                      ? Text(
                          "Error",
                          style: TextStyle(color: Colors.red),
                        )
                      : Text("${currency.money.toStringAsFixed(3)} birr"),
                );
              },
            ),
          );
        } else if (state is CurrencyFailed) {
          return Center(
            child: Text(state.msg),
          );
        }
        return Center(
          child: Text("No Internet Connection!!"),
        );
      },
    );
  }
}
