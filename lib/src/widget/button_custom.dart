import 'package:flutter/cupertino.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mission_timer/core/helper/utils/app_colors.dart';
import 'package:mission_timer/core/helper/utils/theme_data.dart';

// import 'package:gotip_app/core/utils/color.dart';

class ButtonCustom extends StatelessWidget with ThemeDataMixin {
  final Color? fillColor;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? disableColor;
  final String content;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? outlineColor;
  final Color? loadingColor;
  final bool loading;
  const ButtonCustom(
      {Key? key,
      this.padding,
      required this.content,
      this.fillColor,
      this.textStyle,
      this.textColor,
      this.disableColor,
      this.outlineColor,
      this.borderRadius,
      this.loadingColor,
      this.loading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SpinKitCircle(
          size: 70, color: loadingColor ?? ColorsApp.mainColor);
    }
    return CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        child: Container(
            width: double.maxFinite,
            padding: padding ?? EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: onPressed == null
                        ? disableColor ?? colorScheme.onSurface
                        : (outlineColor ?? fillColor ?? ColorsApp.gray)),
                color: onPressed == null
                    ? disableColor ?? colorScheme.onSurface
                    : (fillColor ?? ColorsApp.colorButton),
                borderRadius: BorderRadius.circular(borderRadius ?? 30)),
            child: Text(content,
                textAlign: TextAlign.center,
                style: textStyle ??
                    textTheme.button!
                        .copyWith(color: textColor ?? ColorsApp.white))),
        disabledColor: disableColor ?? colorScheme.surfaceVariant,
        onPressed: onPressed);
  }
}
