import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';
import '../../l10n/generated/app_localizations.dart';
import 'components/checkout_address_selector.dart';
import 'components/checkout_card_details.dart';
import 'components/checkout_payment_systems.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.checkout),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressSelector(),
            PaymentSystem(),
            CardDetails(),
            PayNowButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class PayNowButton extends StatelessWidget {
  const PayNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.orderSuccessfull);
          },
          child: Text(l10n.payNow),
        ),
      ),
    );
  }
}
