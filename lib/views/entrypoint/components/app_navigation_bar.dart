import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'bottom_app_bar_item.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onNavTap,
  });

  final int currentIndex;
  final void Function(int) onNavTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: AppDefaults.margin,
      color: AppColors.scaffoldBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: BottomAppBarItem(
              name: l10n.home,
              iconLocation: AppIcons.home,
              isActive: currentIndex == 0,
              onTap: () => onNavTap(0),
            ),
          ),
          Expanded(
            child: BottomAppBarItem(
              name: l10n.menu,
              iconLocation: AppIcons.menu,
              isActive: currentIndex == 1,
              onTap: () => onNavTap(1),
            ),
          ),
          const SizedBox(width: 56),
          /* <---- We have to leave this 3rd index (2) for the cart item -----> */
          Expanded(
            child: BottomAppBarItem(
              name: l10n.saved,
              iconLocation: AppIcons.save,
              isActive: currentIndex == 3,
              onTap: () => onNavTap(3),
            ),
          ),
          Expanded(
            child: BottomAppBarItem(
              name: l10n.profile,
              iconLocation: AppIcons.profile,
              isActive: currentIndex == 4,
              onTap: () => onNavTap(4),
            ),
          ),
        ],
      ),
    );
  }
}
