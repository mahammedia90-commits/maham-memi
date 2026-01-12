import 'package:flutter/material.dart';
import '../../l10n/generated/app_localizations.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';
import 'components/coupon_code_field.dart';
import 'components/items_totals_price.dart';
import 'components/single_cart_item_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    this.isHomePage = false,
  });

  final bool isHomePage;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> cartItems = [1, 2, 3];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: widget.isHomePage
          ? null
          : AppBar(
              leading: const AppBackButton(),
              title: Text(l10n.cartPage),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                cartItems.length,
                (index) => SingleCartItemTile(
                  onRemove: () => _removeItem(index),
                ),
              ),
              const CouponCodeField(),
              const ItemTotalsAndPrice(),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.checkoutPage);
                    },
                    child: Text(l10n.checkout),
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
