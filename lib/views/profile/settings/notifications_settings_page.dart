import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/app_back_button.dart';
import '../../../core/components/app_settings_tile.dart';
import '../../../core/constants/constants.dart';
import '../../../l10n/generated/app_localizations.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.changeNotificationSettings),
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              const SizedBox(height: AppDefaults.padding),
              AppSettingsListTile(
                label: l10n.appNotification,
                trailing: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: true,
                    onChanged: (v) {},
                  ),
                ),
              ),
              AppSettingsListTile(
                label: l10n.phoneNotification,
                trailing: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: true,
                    onChanged: (v) {},
                  ),
                ),
              ),
              AppSettingsListTile(
                label: l10n.offerNotification,
                trailing: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (v) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
