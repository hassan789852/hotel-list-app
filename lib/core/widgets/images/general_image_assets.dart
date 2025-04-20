import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class GeneralImageAssets extends StatelessWidget {
  final String path;
  final BoxFit boxFit;
  final double? height;
  final double? width;
  final Color? color;
  final bool matchTextDirection;

  const GeneralImageAssets(
      {super.key,
      required this.path,
      this.boxFit = BoxFit.cover,
      this.height = 50,
      this.width = 50,
      this.matchTextDirection = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    String? imgType = path.split('.').last;
    if (imgType == 'svg') {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          path,
          matchTextDirection: matchTextDirection,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          fit: boxFit,
          height: height,
          width: width,
        ),
      );
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          path,
          color: color,
          fit: boxFit,
          height: height,
          matchTextDirection: matchTextDirection,
          width: width,
        ),
      );
    }
  }
}
