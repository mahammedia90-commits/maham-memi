import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../core/components/product_tile_square.dart';
import '../../../core/components/title_and_action_button.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';

class OurNewItem extends StatelessWidget {
  const OurNewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        TitleAndActionButton(
          title: l10n.ourNewItem,
          onTap: () => Navigator.pushNamed(context, AppRoutes.newItems),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(left: AppDefaults.padding),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              Dummy.products.length,
              (index) => ProductTileSquare(data: Dummy.products[index]),
            ),
          ),
        ),
      ],
    );
  }
}
