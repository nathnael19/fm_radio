import 'package:flutter/material.dart';

class CurrencyListCards extends StatelessWidget {
  final List currency;
  const CurrencyListCards({super.key, required this.currency});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: currency.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            leading: Container(
              width: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(currency[index][0]),
                ),
              ),
            ),
            title: Text(currency[index][1]),
            subtitle: Text(currency[index][2]),
            trailing: Text(
              "${currency[index][3]} ብር",
              style: TextStyle(
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
