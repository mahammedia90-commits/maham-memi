import 'package:flutter/material.dart';

import '../../core/components/network_image.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/utils/ui_util.dart';
import '../../l10n/generated/app_localizations.dart';
import '../cart/dialogs/delivered_successfull.dart';

class OrderSuccessfullPage extends StatelessWidget {
  const OrderSuccessfullPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.all(AppDefaults.padding),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: NetworkImageWithLoader(
                              'https://i.imgur.com/Fj9gVGy.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDefaults.padding),
                        child: Column(
                          children: [
                            Text(
                              l10n.orderSuccessful,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                              child: Text(
                                'Thanks for your order. Your order has placed successfully. Please continue your order.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(AppDefaults.padding),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppDefaults.padding),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    UiUtil.openDialog(
                                      context: context,
                                      widget: const DeliverySuccessfullDialog(),
                                    );
                                  },
                                  child: Text(l10n.continueText),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDefaults.padding,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(l10n.trackOrder),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
