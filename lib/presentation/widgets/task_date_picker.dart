import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/presentation/widgets/custom_text_field.dart';
import 'package:task_nest/providers/date_provider.dart';

class TaskDatePicker extends ConsumerWidget {
  const TaskDatePicker({
    super.key,
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);


    return CustomTextField(
      controller: TextEditingController(),
      title: "Date",
      hintText: DateFormat('d/MM/yyyy').format(selectedDate),
      suffixIcon: IconButton(
        onPressed: (){
          _selectDate(context, ref, selectedDate: selectedDate);
        },
        icon: const Icon(FontAwesomeIcons.calendar),
      ),
      readOnly: true,
      onChanged: (value){
      },
    );
  }
  Future<void> _selectDate(BuildContext context,WidgetRef ref, {required DateTime selectedDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      ref.read(selectedDateProvider.notifier).state = picked;
    }
  }
}
