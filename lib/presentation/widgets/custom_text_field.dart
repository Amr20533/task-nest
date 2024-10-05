import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_nest/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title,this.maxLines = 1, this.onChanged, required this.hintText, required this.controller, this.suffixIcon, this.readOnly = false});
  final String title;
  final int maxLines;
  final String hintText;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 20),),
        const Gap(10),
        TextField(
        controller: controller,
          readOnly: readOnly,
          onTapOutside: (event){
              FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.titleSmall!.copyWith(color: context.colorScheme.outline, fontSize: 16),
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
