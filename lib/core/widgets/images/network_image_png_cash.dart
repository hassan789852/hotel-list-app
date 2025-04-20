import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


import 'general_image_assets.dart';

///Create an image or provide a widget or path to a fallback value
///[failWidget] the widget to show if loading of image faild
///[placeHolderWhileLoading] the widget to show while loading the image
class NetworkImagePngv2 extends StatelessWidget {
  // static Widget fallbackFlag = Center(
  //     child: const Icon(Icons.image_not_supported_rounded,
  //         color: AppColors.lighterGrey));
  static Widget fallbackFlagV2 = const Icon(Icons.image_not_supported_outlined);
  static Widget loadingDefault = Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child:  Icon(Icons.drag_indicator_sharp),
  );

  final Widget? failWidget;
  final String url;
  final BoxFit boxFit;
  final bool matchTextDirection;
  final double? height;
  final double? width;
  final Widget? placeHolderWhileLoading;
  final Color? color;

  //when app can't ,load image
  Widget errorBuilder(
      BuildContext context, Object exception, StackTrace? stackTrace) {
    return failWidget ?? fallbackFlagV2;
  }

  //while app load the image
  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return placeHolderWhileLoading ?? loadingDefault;
  }

  const NetworkImagePngv2({
    super.key,
    required this.url,
    this.failWidget,
    this.height = 50,
    this.width = 50,
    this.matchTextDirection = true,
    this.boxFit = BoxFit.cover,
    this.placeHolderWhileLoading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      matchTextDirection: matchTextDirection,
      fit: boxFit,
      width: width,
      placeholder: (context, url) => placeHolderWhileLoading?? loadingDefault,
      errorWidget: (context, url, error) => failWidget?? fallbackFlagV2,
    );
  }
}
