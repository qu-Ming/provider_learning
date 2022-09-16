import 'package:flutter/material.dart';
import 'package:test_provider/components/text_component.dart';

import '../utils/const/app_dimens.dart';

class ButtonNumberComponent extends StatelessWidget {
  const ButtonNumberComponent(
      {Key? key, this.buttonText, this.color, this.textColor, this.onTap})
      : super(key: key);

  final String? buttonText;
  final Color? color;
  final Color? textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          child: Center(
            child: TextComponent(
              colorText: textColor,
              text: buttonText.toString(),
              textSize: AppDimens.text_size_16,
            ),
          ),
        ),
      ),
    );
  }
}
