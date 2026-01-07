import 'package:flutter/material.dart';

import '../../../core/components/app_back_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'components/custom_tab_label.dart';
import 'components/tab_all.dart';
import 'components/tab_completed.dart';
import 'components/tab_running.dart';

class AllOrderPage extends StatelessWidget {
  const AllOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButton(),
          title: Text(l10n.myOrder),
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            tabs: [
              CustomTabLabel(label: l10n.all, value: '(58)'),
              CustomTabLabel(label: l10n.running, value: '(14)'),
              CustomTabLabel(label: l10n.previous, value: '(44)'),
            ],
          ),
        ),
        body: Container(
          color: AppColors.cardColor,
          child: const TabBarView(
            children: [
              AllTab(),
              RunningTab(),
              CompletedTab(),
            ],
          ),
        ),
      ),
    );
  }
}
