import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_list_app/core/widgets/images/network_image_svg.dart';

import 'network_image_png_cash.dart';

class GeneralNetworkImage extends StatelessWidget {
  final Widget? failWidget;
  final String url;
  final BoxFit boxFit;
  final double? height;
  final bool matchTextDirection;
  final double? width;
  final Widget? placeHolderWhileLoading;
  final Color? color;
  const GeneralNetworkImage({
    super.key,
    required this.url,
    this.failWidget,
    this.height = 50,
    this.matchTextDirection = false,
    this.width = 50,
    this.boxFit = BoxFit.cover,
    this.placeHolderWhileLoading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    String? imgType = url.split('.').last;
    String newUrl = url.replaceAll(' ', '%20');
    if (kDebugMode) {
      print(newUrl);
    }
    if (imgType == "svg") {
      return NetworkImageSvg(
        url: newUrl,
        height: height,
        matchTextDirection: matchTextDirection,
        width: width,
        color: color,
        boxFit: boxFit,
        failWidget: failWidget,
        placeHolderWhileLoading: placeHolderWhileLoading,
      );
    } else {
      return NetworkImagePngv2(
        url: newUrl,
        height: height,
        width: width,
        color: color,
        boxFit: boxFit,
        matchTextDirection: matchTextDirection,
        failWidget: failWidget,
        placeHolderWhileLoading: placeHolderWhileLoading,
      );
    }
  }
}
