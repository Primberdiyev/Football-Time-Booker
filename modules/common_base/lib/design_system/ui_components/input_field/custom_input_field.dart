import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText,
    this.borderRadius = 12,
    this.onSuffixIconTapped,
    this.inputFormatters,
    this.imagePath,
    this.borderColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    this.maxLength,
    this.hintTextStyle,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.isEnabled = true,
    this.textAlign = TextAlign.start,
  });

  final String? hintText;
  final bool? obscureText;
  final double borderRadius;
  final TextEditingController? controller;
  final VoidCallback? onSuffixIconTapped;
  final EdgeInsets contentPadding;
  final int? maxLength;
  final TextStyle? hintTextStyle;
  final bool isEnabled;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final SvgGenImage? imagePath;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode focusNode;
  final ValueNotifier<bool> isFocusedNotifier = ValueNotifier(false);
  late bool? obscureText;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_handleFocusChange);
    obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    isFocusedNotifier.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    isFocusedNotifier.value = focusNode.hasFocus;
  }

  Color? getIconColor({
    required BuildContext context,
    required bool isFocused,
    required bool hasText,
  }) {
    final themeInputField = context.theme.colors.inputFieldColors;

    if (isFocused) {
      return themeInputField.activeIconColor;
    } else if (hasText) {
      return themeInputField.iconFieldNotEmptyColor;
    } else {
      return themeInputField.iconFieldEmptyColor;
    }
  }

  Color getBGColor({
    required bool isFocused,
    required BuildContext context,
  }) {
    final themeInputField = context.theme.colors.inputFieldColors;

    return !isFocused
        ? themeInputField.bgNotActiveColor
        : themeInputField.bgActiveColor;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;
    final themeInputField = theme.colors.inputFieldColors;
    final themeTextStyle = theme.textStyles;
    final bMBody14 = themeTextStyle.body.bMBody14;
    final hintTextStyle = widget.hintTextStyle ??
        bMBody14.copyWith(
          color: colors.textColors.hintTextColor,
        );
    final textStyle = widget.textStyle ?? themeTextStyle.body.sbMBody14;

    return ValueListenableBuilder<bool>(
      valueListenable: isFocusedNotifier,
      builder: (
        context,
        isFocused,
        _,
      ) {
        final image = widget.imagePath;

        return TextField(
          textAlign: widget.textAlign,
          controller: widget.controller,
          keyboardType: widget.textInputType == TextInputType.text
              ? null
              : TextInputType.number,
          focusNode: focusNode,
          style: textStyle,
          obscureText: obscureText == true,
          enableSuggestions: false,
          autocorrect: false,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            enabled: widget.isEnabled,
            counterText: '',
            contentPadding: widget.contentPadding,
            filled: true,
            fillColor: getBGColor(isFocused: isFocused, context: context),
            prefixIcon: (image != null)
                ? image.svg(
                    // height: 20,
                    // width: 20,
                    fit: BoxFit.none,
                    // colorFilter: ColorFilter.mode(
                    //   getBGColor(isFocused: isFocused, context: context),
                    //   BlendMode.srcIn,
                    // ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: hintTextStyle,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeInputField.activeBorderColor,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    widget.borderColor ?? themeInputField.iconFieldEmptyColor,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        );
      },
    );
  }
}
