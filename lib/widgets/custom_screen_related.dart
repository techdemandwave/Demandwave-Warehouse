import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../utils/colors.dart';

enum TextSize { HEADING1, HEADING2, NORMAL, SMALL, VERYSMALL }

double _getTextSize(TextSize textSize) {
  switch (textSize) {
    case TextSize.HEADING1:
      return 24;
    case TextSize.HEADING2:
      return 20;
    case TextSize.NORMAL:
      return 14;
    case TextSize.SMALL:
      return 12;
    case TextSize.VERYSMALL:
      return 10;
  }
}

AppBar? appBar({
  required title,
  required context,
  List<Widget>? actions,
  bool showBackButton = true,
}) {
  return AppBar(
    actions: actions,
    backgroundColor: AppColors.whiteNew,
    leading: showBackButton
        ? GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(LucideIcons.circleArrowLeft, color: AppColors.amber),
          )
        : null,
    title: appText(title, fontSize: TextSize.HEADING2, color: AppColors.blue),
  );
}

Widget appText(
  String text, {
  TextStyle? style,
  FontWeight? fontWeight = FontWeight.w500,
  TextSize? fontSize = TextSize.NORMAL,
  Color? color,
  dynamic prefixIcon,
  FontStyle? fontStyle,
  TextOverflow? textOverflow,
  TextAlign? align,
  bool isTap = false,
  VoidCallback? onTap,

  /// 👇 optional param
  bool isMandatory = false,
}) {
  final baseStyle = GoogleFonts.figtree(
    textStyle: style,
    fontSize: _getTextSize(fontSize!),
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color ?? AppColors.gray,
  );

  Widget textWidget;

  if (isMandatory) {
    textWidget = RichText(
      textAlign: align ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.visible,
      text: TextSpan(
        style: baseStyle,
        children: [
          TextSpan(text: text),
          const TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  } else {
    textWidget = Text(
      text,
      overflow: textOverflow,
      textAlign: align ?? TextAlign.start,
      style: baseStyle,
    );
  }

  if (isTap && onTap != null) {
    return GestureDetector(onTap: onTap, child: textWidget);
  }
  return textWidget;
}
