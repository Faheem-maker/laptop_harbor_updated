import 'package:flutter/material.dart';
import 'package:laptop_harbor/Common/Widgets/app_button.dart';
import 'package:laptop_harbor/Common/Widgets/item_widget.dart';
import 'package:laptop_harbor/Screens/Catalogue/catalogue.dart';
import 'package:laptop_harbor/Screens/Product/product.dart';
import 'package:laptop_harbor/common/Widgets/category_widget.dart';
import 'package:laptop_harbor/Utils/app_colors.dart';
import 'package:laptop_harbor/Utils/font_styles.dart';
import 'package:laptop_harbor/dummy/dummy_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);
  static final String routeName = 'products';

  @override
  State<AllProductsScreen> createState() => _DasboardState();
}

class _DasboardState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          __buildProducts(context),
        ],
      ),
    );
  }

  
  Widget _buildSellerCard() {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 50.0.h),
      height: 88.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Stack(
        children: [
          Positioned(
              top: screenHeight * .020.h,
              left: 20.0,
              child: Text(
                'Fashion Sale',
                style: FontStyles.montserratBold25()
                    .copyWith(color: AppColors.white),
              )),
          Positioned(
            top: screenHeight * .070.h,
            left: 20.0.w,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12.0.h,
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget __buildProducts(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
          left: 20.0.w, right: 20.0.w, top: 20.h, bottom: screenHeight * .09.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Products',
            style: FontStyles.montserratBold19()
                .copyWith(color: const Color(0xFF34283E)),
          ),
          SizedBox(height: 10.0.h),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: DummyData.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270.0.h,
                  crossAxisSpacing: 10.0.w),
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(), settings: RouteSettings(arguments: DummyData.products[index])),);
                    },
                    child: Expanded(
                      child: ItemWidget(
                        index: index,
                        favoriteIcon: true,
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
    // const SizedBox(height: 20.0),
  }
}
