import 'package:flutter/material.dart';

import '../../../core/constants/app_defaults.dart';

import '../../../core/components/app_back_button.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'components/new_card_row.dart';
import 'components/default_card.dart';
import 'components/payment_option_tile.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.paymentOption),
      ),
      body: Column(
        children: [
          const SizedBox(height: AppDefaults.padding),
          const AddNewCardRow(),
          const PaymentDefaultCard(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Text(
                l10n.otherPaymentOption,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          PaymentOptionTile(
            icon: 'https://i.imgur.com/7pI5714.png',
            label: l10n.paypal,
            accountName: 'mypaypal@gmail.com',
            onTap: () {},
          ),
          PaymentOptionTile(
            icon: 'https://i.imgur.com/aRJj3iU.png',
            label: l10n.cashOnDelivery,
            accountName: l10n.payInCash,
            onTap: () {},
          ),
          PaymentOptionTile(
            icon: 'https://i.imgur.com/lLUcMC1.png',
            label: l10n.applePay,
            accountName: 'applepay.com',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
