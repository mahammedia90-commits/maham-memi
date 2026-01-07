import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';

import '../../../core/components/dotted_divider.dart';
import '../../../core/constants/constants.dart';
import 'item_row.dart';

class ItemTotalsAndPrice extends StatelessWidget {
  const ItemTotalsAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Column(
        children: [
          ItemRow(
            title: l10n.totalItem,
            value: '6',
          ),
          ItemRow(
            title: l10n.weight,
            value: '33 Kg',
          ),
          ItemRow(
            title: l10n.price,
            value: '\$ 82.25',
          ),
          ItemRow(
            title: l10n.discount,
            value: '\$ 12.25',
          ),
          const DottedDivider(),
          ItemRow(
            title: l10n.totalPrice,
            value: '\$ 70.25',
          ),
        ],
      ),
    );
  }
}
