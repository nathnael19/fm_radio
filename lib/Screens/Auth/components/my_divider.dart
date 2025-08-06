import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 0.5, color: Colors.grey, endIndent: 10),
        ),
        Text(
          local.or,
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
            fontSize: getMobileFontSize(context, 16),
          ),
        ),
        const Expanded(
          child: Divider(thickness: 0.5, color: Colors.grey, indent: 10),
        ),
      ],
    );
  }
}
