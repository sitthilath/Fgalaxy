import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

Widget widthBox(double width) {
  return SizedBox(width: width);
}

Widget heightBox(double height) => SizedBox(height: height);

Widget? focusDisable(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
  return null;
}

Widget cacheImageNetwork(
  String image, {
  double width = 100,
  double height = 100,
  bool isProfile = false,
  bool isContain = false,
  bool isFixWidth = false,
}) {
  return CachedNetworkImage(
    width: width,
    height: height,
    imageUrl: image,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: _img(isContain, isFixWidth),
          // colorFilter:
          // ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) => Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.whiteColor),
      ),
    ),
    errorWidget: (context, url, error) => isProfile
        ? SvgPicture.string(
            AppConstants.userIcon,
            fit: BoxFit.cover,
          )
        : Icon(
            Icons.error_outline,
            color: AppColor.errorColor,
          ),
  );
}

BoxFit _img(bool isContain, bool isFitWidth) {
  if (isContain) {
    return BoxFit.contain;
  } else if (isFitWidth) {
    return BoxFit.fitWidth;
  }
  return BoxFit.cover;
}
