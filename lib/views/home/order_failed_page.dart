import 'package:flutter/material.dart';

import '../../core/components/network_image.dart';
import '../../core/constants/app_defaults.dart';
import '../../l10n/generated/app_localizations.dart';

class OrderFailedPage extends StatelessWidget {
  const OrderFailedPage({super.key});

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
                              'https://i.imgur.com/vPVGf8C.png',
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
                              l10n.orderFailed,
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
                                'Sorry, somethings went wrong.\nPlease try again continue your order',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(AppDefaults.padding * 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(l10n.tryAgain),
                          ),
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
