import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../core/constants/constants.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(AppImages.roundedLogo),
          ),
        ),
        Text(
          l10n.welcomeTo,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          l10n.appTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
        )
      ],
    );
  }
}
