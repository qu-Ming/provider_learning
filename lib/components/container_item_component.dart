import 'package:flutter/material.dart';

class ContainerItemComponent extends StatelessWidget {
  const ContainerItemComponent(
      {Key? key,
      this.color,
      this.sizeIcon,
      this.iconData,
      this.text = 'text',
      this.colorText,
      this.colorIcon,
      this.fontSize = 12.0})
      : super(key: key);

  final Color? color;
  final Color? colorText;
  final Color? colorIcon;
  final IconData? iconData;
  final double? sizeIcon;
  final String? text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: color),
          child: Icon(
            iconData,
            size: sizeIcon,
            color: colorIcon,
          ),
        ),
        Text(
          text.toString(),
          style: TextStyle(
              color: colorText, fontFamily: "Poppins", fontSize: fontSize!),
        ),
      ],
    );
  }
}
