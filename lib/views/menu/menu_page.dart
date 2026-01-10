import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/routes/app_routes.dart';
import '../../l10n/generated/app_localizations.dart';
import 'components/category_tile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            l10n.chooseCategory,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          const CateogoriesGrid()
        ],
      ),
    );
  }
}

class CateogoriesGrid extends StatelessWidget {
  const CateogoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          CategoryTile(
            imageLink: 'https://i.imgur.com/tGChxbZ.png',
            label: l10n.vegetables,
            backgroundColor: AppColors.primary,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/yOFxoIP.png',
            label: l10n.meatAndFish,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/GPsRaFC.png',
            label: l10n.medicine,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/mGRqfnc.png',
            label: l10n.babyCare,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/fwyz4oC.png',
            label: l10n.officeSupplies,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/DNr8a6R.png',
            label: l10n.beauty,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/O2ZX5nR.png',
            label: l10n.gymEquipment,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/wJBopjL.png',
            label: l10n.gardeningTools,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/P4yJA9t.png',
            label: l10n.petCare,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/sxGf76e.png',
            label: l10n.eyeWears,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/BPvKeXl.png',
            label: l10n.pack,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
          CategoryTile(
            imageLink: 'https://i.imgur.com/m65fusg.png',
            label: l10n.others,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.comingSoon);
            },
          ),
        ],
      ),
    );
  }
}
