import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/components/buy_now_row_button.dart';
import '../../core/components/price_and_quantity.dart';
import '../../core/components/product_images_slider.dart';
import '../../core/components/review_row_button.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/models/dummy_product_model.dart';
import '../../core/routes/app_routes.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, this.product});

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    final ProductModel? data = product as ProductModel?;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Product Details'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: BuyNowRow(
            onBuyButtonTap: () {
              Navigator.pushNamed(context, AppRoutes.cartPage);
            },
            onCartButtonTap: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImagesSlider(
              images: data?.images ?? [
                'https://i.imgur.com/3o6ons9.png',
                'https://i.imgur.com/3o6ons9.png',
                'https://i.imgur.com/3o6ons9.png',
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.name ?? 'Product Name',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text('Weight: ${data?.weight ?? ''}'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
              child: PriceAndQuantityRow(
                currentPrice: data?.price ?? 20,
                orginalPrice: data?.mainPrice ?? 30,
                quantity: 1,
              ),
            ),
            const SizedBox(height: 8),

            /// Product Details
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Details',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Duis aute veniam veniam qui aliquip irure duis sint magna occaecat dolore nisi culpa do. Est nisi incididunt aliquip  commodo aliqua tempor.',
                  ),
                ],
              ),
            ),

            /// Review Row
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDefaults.padding,
                // vertical: AppDefaults.padding,
              ),
              child: Column(
                children: [
                  Divider(thickness: 0.1),
                  ReviewRowButton(totalStars: 5),
                  Divider(thickness: 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
