import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/constants/app_icons.dart';
import '../../core/routes/app_routes.dart';
import '../../core/components/app_settings_tile.dart';
import '../../l10n/generated/app_localizations.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.menu),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Column(
          children: [
            AppSettingsListTile(
              label: l10n.inviteFriend,
              trailing: SvgPicture.asset(AppIcons.right),
            ),
            AppSettingsListTile(
              label: l10n.aboutUs,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.aboutUs),
            ),
            AppSettingsListTile(
              label: l10n.faqs,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.faq),
            ),
            AppSettingsListTile(
              label: l10n.termsConditions,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.termsAndConditions),
            ),
            AppSettingsListTile(
              label: l10n.helpCenter,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.help),
            ),
            AppSettingsListTile(
              label: l10n.rateApp,
              trailing: SvgPicture.asset(AppIcons.right),
              // onTap: () => Navigator.pushNamed(context, AppRoutes.help),
            ),
            AppSettingsListTile(
              label: l10n.privacyPolicy,
              trailing: SvgPicture.asset(AppIcons.right),
              // onTap: () => Navigator.pushNamed(context, AppRoutes.),
            ),
            AppSettingsListTile(
              label: l10n.contactUs,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.contactUs),
            ),
            const SizedBox(height: AppDefaults.padding * 3),
            AppSettingsListTile(
              label: l10n.logout,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.introLogin),
            ),
          ],
        ),
      ),
    );
  }
}
