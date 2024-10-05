import 'package:flutter/material.dart';
import 'package:task_nest/utils/extensions.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height * 0.06,
      // margin: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.00),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: context.textTheme.titleLarge!.copyWith(color: colors.surface, fontSize: 20),),
        ),
      ),
    );
  }
}
