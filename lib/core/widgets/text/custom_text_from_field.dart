
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_list_app/core/theme/app_colors.dart';
import 'package:hotel_list_app/core/theme/app_theme.dart';


class CustomTextFormField extends StatefulWidget {
  final GestureTapCallback? onTap;
  final bool autofocus;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  String? fontFamily;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final double borderFocusedWidth;
  final double borderEnabledWidth;
  final double? width;
  BorderRadius? borderRadius;
  final BorderStyleType borderStyleType;
  final Color? fillColor;
  final Color? cursorColor;
  final bool? isDense;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? margin;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final FocusNode? focusNode;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? label;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final bool? filled;
  final Color? suffixIconColor;
  final Color? borderEnabledColor;
  final Color? borderFocusedColor;
  final Color? borderErrorColor;
  final bool readOnly;
  final TextStyle? style;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onEditingComplete;
  final TapRegionCallback? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextFormField({
    super.key,
    this.onTap,
    this.autofocus = false,
    this.controller,
    this.fontFamily,
    this.maxLength,
    this.textAlign,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.hintText = '',
    this.contentPadding,
    this.hintStyle,
    this.prefixIconConstraints,
    this.borderFocusedWidth = 1,
    this.borderEnabledWidth = 1,
    this.borderRadius,
    this.width,
    this.borderStyleType = BorderStyleType.none,
    this.fillColor,
    this.cursorColor,
    this.isDense,
    this.margin,
    this.onChanged,
    this.enabled,
    this.focusNode,
    this.icon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.label,
    this.floatingLabelBehavior,
    this.floatingLabelAlignment,
    this.filled,
    this.suffixIconColor,
    this.readOnly = false,
    this.style,
    this.onSaved,
    this.borderEnabledColor,
    this.borderFocusedColor,
    this.borderErrorColor,
    this.onEditingComplete,
    this.onTapOutside, this.inputFormatters,
  }) {
    borderRadius ??= BorderRadius.circular(5);
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late Map<BorderType, InputBorder> underline;
  late Map<BorderType, InputBorder> outlineInput;
  late Map<BorderType, InputBorder> noneBorderInput;

  @override
  void initState() {
    super.initState();

    underline = {
      BorderType.enabled: AppTheme.enableUnderLineBorder.copyWith(
          borderSide: AppTheme.enableUnderLineBorder.borderSide
              .copyWith(color: widget.borderEnabledColor)),
      BorderType.focused: AppTheme.focusUnderLineBorder.copyWith(
          borderSide: AppTheme.focusUnderLineBorder.borderSide
              .copyWith(color: widget.borderFocusedColor)),
      BorderType.error: AppTheme.errorUnderLineBorder.copyWith(
          borderSide: AppTheme.errorUnderLineBorder.borderSide
              .copyWith(color: widget.borderErrorColor)),
    };

    outlineInput = {
      BorderType.enabled: AppTheme.enabledBorder.copyWith(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
          borderSide: AppTheme.enabledBorder.borderSide
              .copyWith(color: widget.borderEnabledColor, width: widget.borderEnabledWidth)),
      BorderType.focused: AppTheme.focusedBorder.copyWith(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
          borderSide: AppTheme.focusedBorder.borderSide
              .copyWith(color: widget.borderFocusedColor, width: widget.borderFocusedWidth)),
      BorderType.error: AppTheme.errorBorder.copyWith(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
          borderSide: AppTheme.errorBorder.borderSide
              .copyWith(color: widget.borderErrorColor,))
    };

    noneBorderInput = {
      BorderType.enabled: InputBorder.none,
      BorderType.focused: InputBorder.none,
      BorderType.error: InputBorder.none,
    };
  }

  //----------------------- not used ---------------------------------------------
  Map<BorderType, InputBorder> getBorder(
      {required BorderStyleType borderStyleType}) {
    switch (borderStyleType) {
      case BorderStyleType.outlineInput:
        return outlineInput;
      case BorderStyleType.underline:
        return underline;
      case BorderStyleType.none:
        return noneBorderInput;
      default:
        return noneBorderInput;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      margin: widget.margin ?? EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            onTap: widget.onTap,
            maxLength: widget.maxLength,
            autofocus: widget.autofocus,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            validator: widget.validator,
            maxLines: widget.maxLines,
            cursorColor: widget.cursorColor ?? AppColors.main,
            onChanged: widget.onChanged,
            cursorRadius: const Radius.circular(15),
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            textAlignVertical: TextAlignVertical.center,
            readOnly: widget.readOnly,
            onSaved: widget.onSaved,
            onTapOutside: widget.onTapOutside,
            minLines: widget.minLines,
            inputFormatters: widget.inputFormatters,
            textAlign: widget.textAlign ?? TextAlign.start,
            onEditingComplete: widget.onEditingComplete,
            style: widget.style ?? Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              label: widget.label,
              labelStyle: Theme.of(context).textTheme.bodySmall,
              counterText: "",
              floatingLabelBehavior: widget.floatingLabelBehavior ??
                  Theme.of(context).inputDecorationTheme.floatingLabelBehavior,
              floatingLabelAlignment: widget.floatingLabelAlignment ??
                  Theme.of(context).inputDecorationTheme.floatingLabelAlignment,
              // errorStyle:Theme.of(context).textTheme.labelLarge,
              // focusColor: Theme.of(context).primaryColor,
              fillColor: widget.fillColor ??
                  Theme.of(context).inputDecorationTheme.fillColor,
              filled: widget.filled ??
                  Theme.of(context).inputDecorationTheme.filled,
              icon: widget.icon,
              focusedBorder: getBorder(
                  borderStyleType: widget.borderStyleType)[BorderType.focused],
              enabledBorder: getBorder(
                  borderStyleType: widget.borderStyleType)[BorderType.enabled],
              errorBorder: getBorder(
                  borderStyleType: widget.borderStyleType)[BorderType.error],
              focusedErrorBorder: getBorder(
                  borderStyleType: widget.borderStyleType)[BorderType.focused],
              disabledBorder: getBorder(
                  borderStyleType: widget.borderStyleType)[BorderType.enabled],
              prefixIcon: widget.prefixIcon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: widget.prefixIcon ?? const SizedBox()),
                      ],
                    )
                  : null,
              prefixIconConstraints: widget.prefixIconConstraints ??
                  BoxConstraints(maxWidth: 40, maxHeight: 30),
              suffixIcon: widget.suffixIcon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.suffixIcon ?? const SizedBox(),
                      ],
                    )
                  : null,

              suffixIconColor: widget.suffixIconColor ??
                  Theme.of(context).inputDecorationTheme.prefixIconColor,

              suffixIconConstraints: widget.suffixIconConstraints ??
                  BoxConstraints(maxWidth: 48, maxHeight: 20),
              // constraints: BoxConstraints(maxHeight: 50.h),
              contentPadding: widget.contentPadding ??
                  Theme.of(context).inputDecorationTheme.contentPadding,
              isDense: widget.isDense ??
                  Theme.of(context).inputDecorationTheme.isDense,
              //labelText: labelText,
              hintText: '${widget.hintText}',
              hintStyle: widget.hintStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).hintColor),
            ),
          ),
        ],
      ),
    );
  }
}

enum BorderType { focused, enabled, error }

enum BorderStyleType { outlineInput, underline, none }
