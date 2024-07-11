import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laptop_harbor/Utils/app_colors.dart';
import 'package:laptop_harbor/Utils/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laptop_harbor/models/product.dart';

class CartTile extends StatefulWidget {
  final Product product;
  const CartTile({super.key, required this.product});

  @override
  State<CartTile> createState() => _CartTileState(product: product);
}

class _CartTileState extends State<CartTile> {
  int quantity = 1;

  Product product;
  _CartTileState({required this.product}) {
    if (product.quantity != 0) quantity = product.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.image)),
              borderRadius: BorderRadius.circular(10.0)),
        ),
        Expanded(
          child: Container(
            height: 80.h,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: FontStyles.montserratRegular14(),
                ),
                // SizedBox(height: 20.0),
                Text(
                  '\$${product.price}',
                  style: FontStyles.montserratBold17(),
                )
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(child: Icon(Icons.add_circle_outline, color: AppColors.lightGray), onTap: () {
              setState(() {
                quantity++;
                product.quantity = quantity;
              });
            },),
            Text(quantity.toString(), style: TextStyle(color: AppColors.primaryLight)),
            GestureDetector(
              child: Icon(
                Icons.remove_circle_outline,
                color: AppColors.lightGray,
              ),
              onTap: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                    product.quantity = quantity;
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
