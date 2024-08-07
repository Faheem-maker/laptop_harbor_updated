import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:laptop_harbor/Common/Widgets/app_button.dart';
import 'package:laptop_harbor/Common/Widgets/cart_tile.dart';
import 'package:laptop_harbor/Common/Widgets/item_widget.dart';
import 'package:laptop_harbor/Common/Widgets/shimmer_effect.dart';
import 'package:laptop_harbor/Utils/app_colors.dart';
import 'package:laptop_harbor/Utils/font_styles.dart';
import 'package:laptop_harbor/dummy/dummy_data.dart';
import 'package:laptop_harbor/models/product.dart';
import 'package:laptop_harbor/models/review.dart';
import 'package:laptop_harbor/services/reviews.dart';
import 'package:laptop_harbor/stores/cart.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  static const String routeName = 'product';
  ProductScreen({Key? key}) : super(key: key);
  Product? product = null;
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      product = ModalRoute.of(context)!.settings.arguments as Product;
    }
    return Scaffold(
      backgroundColor: AppColors.whiteLight,
      body: _buildBody(context),
      bottomSheet: _buildBottomSheet(
          context: context,
          onTap: () {
            _buildCartModalSheet(context);
          }),
    );
  }

  Widget _buildBody(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            collapsedHeight: kToolbarHeight,
            expandedHeight: screenHeight * .40.h,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: product!.image,
                // color: const Color.fromRGBO(42, 3, 75, 0.35),
                // colorBlendMode: BlendMode.srcOver,
                fit: BoxFit.cover,
                placeholder: (context, name) {
                  return ShimmerEffect(
                    borderRadius: 0.0.r,
                    height: screenHeight * .40.h,
                    width: screenWidth,
                  );
                },
                errorWidget: (context, error, child) {
                  return ShimmerEffect(
                    borderRadius: 0.0.r,
                    height: screenHeight * .40.h,
                    width: screenWidth,
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAboutProduct(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProductDetail(context),
                  SizedBox(height: 10.0.h),
                  _buildReviews(context),
                  SizedBox(height: 10.0.h),
                  _buildRelatedProduct(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAboutProduct(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRatings(context),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Text(
              product!.name,
              style: FontStyles.montserratRegular19(),
            ),
          ),
          _buildPrice(context, '\$${product!.price}'),
        ],
      ),
    );
  }

  Widget _buildRatings(BuildContext context) {
    return SizedBox(
      height: 20.0.h,
      child: Row(
        children: [
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: AppColors.secondary,
                  size: 14.0,
                );
              }),
        ],
      ),
    );
  }

  Widget _buildColorAndSizeSelection(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 20.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildColorSelection(context),
            SizedBox(height: 20.0.h),
            _buildSizes(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w, top: 10.0.h),
      child: Text(
        price,
        style: FontStyles.montserratBold25(),
      ),
    );
  }

  Widget _buildColorSelection(BuildContext context) {
    List<String> colors = [
      'assets/product/pic1.png',
      'assets/product/pic2.png',
      'assets/product/pic3.png',
      'assets/product/pic4.png',
      'assets/product/pic5.png',
      'assets/product/pic6.png',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Colors',
          style: FontStyles.montserratSemiBold14(),
        ),
        SizedBox(height: 20.0.h),
        SizedBox(
          height: 47.0.h,
          child: ListView.separated(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: 47.h,
                width: 47.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(colors[index])),
                    borderRadius: BorderRadius.circular(10.0.r)),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.0.w);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSizes(BuildContext context) {
    List<String> titles = ['XXS', 'XS', 'S', 'M', 'L', 'XL'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sizes',
          style: FontStyles.montserratSemiBold14(),
        ),
        SizedBox(height: 20.0.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.0.h,
          child: ListView.builder(
            itemCount: titles.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10.0.w),
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                decoration: BoxDecoration(
                    color: index == 0 ? AppColors.secondary : AppColors.white,
                    borderRadius: BorderRadius.circular(5.0.r)),
                child: Center(
                  child: Text(
                    titles[index],
                    style: FontStyles.montserratRegular14().copyWith(
                        color: index == 0
                            ? AppColors.white
                            : AppColors.textLightColor),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetail(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Detail',
            style: FontStyles.montserratBold19(),
          ),
          SizedBox(height: 10.0.h),
          Text(
            'Women\'s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li...',
            style: FontStyles.montserratRegular14(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviews(BuildContext context) {
    var reviews = GetIt.instance<ReviewService>();
    var cart = GetIt.instance<Cart>();
    var nameController = TextEditingController();
    var reviewController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.0.r)),
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: FontStyles.montserratBold19()
                      .copyWith(color: const Color(0xFF34283E)),
                ),
              ],
            ),
            StreamBuilder(
                stream: reviews.getReviews(product!.id),
                builder: (context, AsyncSnapshot<QuerySnapshot> stream) {
                  if (stream.hasData && stream.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No Reviews")
                    );
                  }
                  else if (stream.hasData) {
                    print("Reviews: ${stream.data!.docs.length}");
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: stream.data!.docs.length,
                          itemBuilder: (ctx, idx) {
                            return Column(children: [
                              SizedBox(height: 10.0.h),
                              Text(
                                stream.data!.docs[idx].get("name"),
                                style: FontStyles.montserratSemiBold14(),
                              ),
                              SizedBox(height: 10.0.h),
                              _buildReviewRatings(context, stream.data!.docs[idx].get("rating")),
                              SizedBox(height: 10.0.h),
                              Text(
                                stream.data!.docs[idx].get("review"),
                                style: FontStyles.montserratRegular14(),
                              ),
                            ]);
                          }),
                    );
                  }
                  else {
                    return const Center(
                    child: CircularProgressIndicator(), // Or display an error message
                  );
                  }
                }
            ),
            SizedBox(height: 10,),
            Text("Add Review"),
            Text("Name"),
            TextFormField(controller: nameController,),
            Text("Review"),
            TextFormField(controller: reviewController),
            Text("Rating"),
            AppButton.button(
              text: 'Review',
              color: AppColors.secondary,
              height: 45.0.h,
              width: 150.0.w,
              onTap: () {
                reviews.addReview({'product_id': product!.id, 'rating': 5, 'review': reviewController.value.text, 'name': nameController.value.text});
              },
            ),
            _buildReviewRatings(context, 5),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewRatings(BuildContext context, int rating) {
    return SizedBox(
      height: 20.0.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: rating > index ? AppColors.secondary : AppColors.lightGray,
                  size: 14.0,
                );
              }),
          Text(
            'June 5,2021',
            style: FontStyles.montserratRegular12(),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product related to this item',
            style: FontStyles.montserratBold19()
                .copyWith(color: const Color(0xFF34283E)),
          ),
          SizedBox(height: 10.0.h),
          SizedBox(
            // color: Colors.red,
            height: 310.h,
            // width: 200,
            child: ListView.builder(
                itemCount: 4,
                itemExtent: 180.0.w,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    index: index,
                    favoriteIcon: true,
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildBottomSheet({BuildContext? context, Function()? onTap}) {
    return Container(
      width: double.infinity,
      height: 70.0.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context!);
              },
              child: const Icon(Icons.arrow_back)),
          AppButton.button(
            text: 'Add to cart',
            color: AppColors.secondary,
            height: 48.0.h,
            width: 215.0.w,
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  _buildCartModalSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.white,
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0.r),
                topLeft: Radius.circular(20.0.r))),
        context: context,
        builder: (_) {
          return Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0.r),
                topLeft: Radius.circular(20.0.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5.0.h,
                    width: 60.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0.r),
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
                SizedBox(height: 10.0.h),
                CartTile(product: product!),
                SizedBox(height: 10.0.h),
                // _buildColorSelection(context),
                // SizedBox(height: 10.0.h),
                // _buildSizes(context),
                // SizedBox(height: 10.0.h),
                _buildBottomSheet(
                    context: context,
                    onTap: () async {
                      GetIt.instance<Cart>().products.add(product!);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successfully added to cart"),
                      ));
                    }),
              ],
            ),
          );
        });
  }
}
