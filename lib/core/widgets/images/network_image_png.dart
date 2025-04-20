

import 'package:flutter/material.dart';
import 'package:hotel_list_app/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';




///Create an image or provide a widget or path to a fallback value
///[failWidget] the widget to show if loading of image faild
///[placeHolderWhileLoading] the widget to show while loading the image
class NetworkImagePng extends StatelessWidget {
  static Widget fallbackFlag =  Icon(Icons.image_not_supported_rounded,);
  static Widget loadingDefault = Shimmer.fromColors(baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,child: const Icon(Icons.timer),);

 final Widget? failWidget;
 final String url;
 final BoxFit boxFit;
 final double? height;
 final double? width;
 final Widget? placeHolderWhileLoading;
 final Color? color;



 //when app can't ,load image
   Widget errorBuilder(BuildContext context, Object exception, StackTrace? stackTrace){
     return failWidget??fallbackFlag;
   }
  //while app load the image
  Widget loadingBuilder(BuildContext context, Widget child,
      ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return placeHolderWhileLoading??loadingDefault;
  }

     const NetworkImagePng({
     Key? key ,
     required this.url,
     this.failWidget,
     this.height=50,
     this.width=50,
     this.boxFit=BoxFit.cover,
     this.placeHolderWhileLoading,
     this.color,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Image.network(
      url,
      errorBuilder: errorBuilder,
      color: color,
      height: height,
      width: width,
      fit:boxFit,
      loadingBuilder: loadingBuilder,);
  }
}



