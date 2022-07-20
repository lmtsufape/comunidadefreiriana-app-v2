import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:flutter/material.dart';

import 'horizontal_spacer_box.dart';

class MapInfoTitle extends StatelessWidget {
  final String title;

  const MapInfoTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSpacerBox(size: SpacerSize.small),
        Text(
          title,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
