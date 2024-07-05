import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laptop_harbor/Common/Widgets/shimmer_effect.dart';
import 'package:laptop_harbor/Utils/app_colors.dart';
import 'package:laptop_harbor/Utils/font_styles.dart';
import 'package:laptop_harbor/models/category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({required this.category, this.height, this.width, super.key});
  final double? height, width;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.0.w, top: 17.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: category.url,
              fit: BoxFit.cover,
              width: width,
              color: const Color.fromRGBO(29, 35, 50, 0.2),
              colorBlendMode: BlendMode.srcOver,
              height: height,
              placeholder: (context, error) {
                return ShimmerEffect(
                    borderRadius: 10.0, height: height, width: height);
              },
              errorWidget: (context, errorName, error) {
                return ShimmerEffect(
                    borderRadius: 10.0, height: height, width: width);
              },
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: Center(
              child: Text(
                category.title,
                style: FontStyles.montserratBold14().copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
