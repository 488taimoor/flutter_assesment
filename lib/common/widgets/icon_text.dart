import 'package:flutter/material.dart';
import 'package:mobile/core/resources/dimens.dart';

class IconText extends StatelessWidget {
  const IconText(
      {Key? key,
      this.suffixIcon,
      this.prefixIcon,
      this.iconPadding,
      required this.text})
      : super(key: key);

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? iconPadding;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    final iconSpace = iconPadding ?? Dimensions.padding_4;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixIcon != null)
          Padding(
            padding: EdgeInsets.only(right: iconSpace, left: 0),
            child: prefixIcon,
          ),
        Padding(
          padding: EdgeInsets.only(
              right: suffixIcon != null ? iconSpace : 0,
              left: prefixIcon != null ? iconSpace : 0),
          child: text,
        ),
        if (suffixIcon != null)
          Padding(
            padding: EdgeInsets.only(right: 0, left: iconSpace),
            child: suffixIcon,
          ),
      ],
    );
  }
}
