import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/network_image.dart';
import '../../../core/constants/constants.dart';

class SingleCartItemTile extends StatefulWidget {
  const SingleCartItemTile({
    super.key,
    this.onRemove,
  });

  final VoidCallback? onRemove;

  @override
  State<SingleCartItemTile> createState() => _SingleCartItemTileState();
}

class _SingleCartItemTileState extends State<SingleCartItemTile> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
        vertical: AppDefaults.padding / 2,
      ),
      child: Column(
        children: [
          Row(
            children: [
              /// Thumbnail
              const SizedBox(
                width: 70,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: NetworkImageWithLoader(
                    'https://i.imgur.com/4YEHvGc.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              /// Quantity and Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sulphurfree Bura',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        Text(
                          '570 Ml',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _incrementQuantity,
                        icon: SvgPicture.asset(AppIcons.addQuantity),
                        constraints: const BoxConstraints(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$quantity',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      IconButton(
                        onPressed: _decrementQuantity,
                        icon: SvgPicture.asset(AppIcons.removeQuantity),
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),

              /// Price and Delete labelLarge
              Column(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    onPressed: widget.onRemove,
                    icon: SvgPicture.asset(AppIcons.delete),
                  ),
                  const SizedBox(height: 16),
                  Text('\$${20 * quantity}'),
                ],
              )
            ],
          ),
          const Divider(thickness: 0.1),
        ],
      ),
    );
  }
}
