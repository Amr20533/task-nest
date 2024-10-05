import 'package:flutter/material.dart';
import 'package:task_nest/utils/extensions.dart';

class DisplayLargeText extends StatelessWidget {
  const DisplayLargeText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Text(text, style: context.textTheme.headlineSmall!.copyWith(color: colors.surface, fontWeight: FontWeight.bold, fontSize: 30),);
  }
}