import 'package:flutter/material.dart';

import 'horizontal_spacer_box.dart';
import 'vertical_spacer_box.dart';

class HorizontalInfoSubtitle extends StatelessWidget {
  final String? subtitle;
  const HorizontalInfoSubtitle({Key? key, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSpacerBox(size: SpacerSize.small),
        Expanded(
          child: Text(
            subtitle!,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
        const VerticalSpacerBox(size: SpacerSize.large),
      ],
    );
  }
}
