import 'package:flutter/material.dart';

import '../../core/components/network_image.dart';
import '../../core/constants/constants.dart';
import '../../l10n/generated/app_localizations.dart';

class OrderEmpty extends StatelessWidget {
  const OrderEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        const Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: const AspectRatio(
              aspectRatio: 1 / 1,
              child: NetworkImageWithLoader(
                'https://i.imgur.com/EMI82tU.png',
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
                l10n.noOrdersYet,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                child: Text(
                  l10n.noOrdersMessage,
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
                    onPressed: () {},
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
    );
  }
}
