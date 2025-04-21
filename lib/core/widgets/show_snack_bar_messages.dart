

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../theme/app_colors.dart';

void showSnackBarMessage(BuildContext context,
    {required String message, Color color = Colors.red}) {

  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
      
      backgroundColor: color,
      borderRadius: BorderRadius.circular(5),
      textAlign: TextAlign.start,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.white,
          ),
    ),
  );


}
