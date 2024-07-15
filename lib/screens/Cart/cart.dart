import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:laptop_harbor/Common/Widgets/app_button.dart';
import 'package:laptop_harbor/Common/Widgets/cart_tile.dart';
import 'package:laptop_harbor/Common/Widgets/custom_app_bar.dart';
import 'package:laptop_harbor/Screens/CheckOut/check_out.dart';
import 'package:laptop_harbor/Utils/app_colors.dart';
import 'package:laptop_harbor/Utils/font_styles.dart';
import 'package:laptop_harbor/stores/cart.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteLight,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize:
          Size(double.infinity, MediaQuery.of(context).size.height * .20.h),
      child: CustomAppBar(
        isHome: false,
        title: 'Cart',
        fixedHeight: 88.0.h,
        enableSearchField: false,
        // leadingIcon: Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
        leadingOnTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var products = GetIt.instance<Cart>().products;

    return Container(
      child: ListView.separated(
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.white,
            margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
            child: CartTile(product: products[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    var products = GetIt.instance<Cart>().products;

    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total price', style: FontStyles.montserratBold19()),
                Text('\$${products.fold(0, (previous, current) => previous + current.price * current.quantity)}', style: FontStyles.montserratBold19()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0.h),
            child: AppButton.button(
              text: 'Check Out',
              color: AppColors.secondary,
              height: 48.h,
              width: size.width - 20.w,
              onTap: () {
                Navigator.pushNamed(context, "/checkout");
              },
            ),
          ),
        ],
      ),
    );
  }
}
