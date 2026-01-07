import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../core/routes/app_routes.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.dontHaveAccount),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
          child: Text(l10n.signUp),
        ),
      ],
    );
  }
}
