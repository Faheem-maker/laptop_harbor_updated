import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laptop_harbor/Common/Widgets/shimmer_effect.dart';
import 'package:laptop_harbor/Utils/app_colors.dart';
import 'package:laptop_harbor/Utils/font_styles.dart';
import 'package:laptop_harbor/dummy/dummy_data.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({this.index, this.favoriteIcon, Key? key}) : super(key: key);
  final int? index;
  final bool? favoriteIcon;
  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeaturedWidget(context, widget.index),
        _buildFeaturedItemText(context),
        _buildFeaturedItemPrice(context),
      ],
    );
  }

  Widget _buildFeaturedWidget(BuildContext context, index) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 163.h,
                width: 163.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: DummyData.products[index].image,
                  fit: BoxFit.cover,
                  placeholder: (context, name) {
                    return ShimmerEffect(
                        borderRadius: 10.0,
                        height: screenHeight * .15,
                        width: screenWidth * .40);
                  },
                  errorWidget: (context, error, child) {
                    return ShimmerEffect(
                      borderRadius: 10.0,
                      height: screenHeight * .20,
                      width: screenWidth * .45,
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 47.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFFF49763), Color(0xFFD23A3A)],
                  stops: [0, 1],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Center(
                child: Text(
                  '50%',
                  style: FontStyles.montserratBold17()
                      .copyWith(fontSize: 11.0, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
        _buildRatings(context),
      ],
    );
  }

  Widget _buildRatings(BuildContext context) {
    return SizedBox(
      height: 20,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star,
              color: AppColors.secondary,
              size: 10.0,
            );
          }),
    );
  }

  Widget _buildFeaturedItemText(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .40,
      child: Text(
        'ECOWISH Womens Color Block Striped Draped K...',
        style: FontStyles.montserratRegular14().copyWith(
          color: const Color(0xFF34283E),
        ),
      ),
    );
  }

  Widget _buildFeaturedItemPrice(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .40,
      child: Text(
        '\$102.33',
        style: FontStyles.montserratBold17(),
      ),
    );
  }
}
