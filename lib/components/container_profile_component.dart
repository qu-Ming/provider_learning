import 'package:flutter/material.dart';
import 'package:test_provider/components/text_component.dart';

import '../utils/const/app_colors.dart';
import '../utils/const/app_dimens.dart';

class ContainerProfileComponent extends StatelessWidget {
  const ContainerProfileComponent({Key? key, required this.text, this.icon})
      : super(key: key);
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.colorGrey, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.backGourndColor,
            ),
            child: Icon(
              icon,
              color: AppColors.colorWhite,
              size: AppDimens.icon_size_28,
            ),
          ),
          Expanded(
            flex: 9,
            child: TextComponent(
              text: text,
              textSize: AppDimens.text_size_14,
            ),
          ),
          const Expanded(flex: 1, child: Icon(Icons.chevron_right))
        ],
      ),
    );
  }
}
