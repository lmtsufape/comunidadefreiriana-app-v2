import 'package:flutter/material.dart';
import 'package:comunidadefreiriana/constants/constants.dart';

enum SpacerSize {
  tiny,
  small,
  medium,
  large,
}

class VerticalSpacerBox extends StatelessWidget {
  final SpacerSize size;
  double buildSizes(SpacerSize size) {
    switch (size) {
      case SpacerSize.tiny:
        return kTinyHeight;
      case SpacerSize.small:
        return kSmallHeight;
      case SpacerSize.medium:
        return kMediumtHeight;
      case SpacerSize.large:
        return kLargeHeight;
      default:
        return kMediumtHeight;
    }
  }

  const VerticalSpacerBox({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: buildSizes(size));
  }
}
