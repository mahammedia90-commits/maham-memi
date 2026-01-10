import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../core/components/app_back_button.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/components/app_settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.setting),
      ),
      backgroundColor: AppColors.cardColor,
      body: Container(
        margin: const EdgeInsets.all(AppDefaults.padding),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding,
          vertical: AppDefaults.padding * 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackground,
          borderRadius: AppDefaults.borderRadius,
        ),
        child: Column(
          children: [
            AppSettingsListTile(
              label: l10n.language,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.settingsLanguage),
            ),
            AppSettingsListTile(
              label: l10n.notifications,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.settingsNotifications),
            ),
            AppSettingsListTile(
              label: l10n.changePassword,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.changePassword),
            ),
            AppSettingsListTile(
              label: l10n.changePhoneNumber,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.changePhoneNumber),
            ),
            AppSettingsListTile(
              label: l10n.deliveryAddress,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.deliveryAddress),
            ),
            AppSettingsListTile(
              label: l10n.editProfile,
              trailing: SvgPicture.asset(AppIcons.right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.profileEdit),
            ),
            const SizedBox(height: AppDefaults.padding * 2),
            AppSettingsListTile(
              label: l10n.logout,
              trailing: SvgPicture.asset(AppIcons.profileLogout),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.introLogin,
                (route) => false,
              ),
            ),
            AppSettingsListTile(
              label: l10n.deleteAccount,
              trailing: const Icon(Icons.delete_forever, color: Colors.red),
              onTap: () => _showDeleteAccountDialog(context, l10n),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteAccount),
        content: Text(l10n.deleteAccountConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.introLogin,
                (route) => false,
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }
}
