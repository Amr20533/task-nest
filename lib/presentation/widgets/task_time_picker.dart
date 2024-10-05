import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/presentation/widgets/custom_text_field.dart';
import 'package:task_nest/providers/time_provider.dart';

class TaskTimePicker extends ConsumerWidget {
  const TaskTimePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(selectedTimeProvider);

      return CustomTextField(
      controller: TextEditingController(),
      title: "Time",
      hintText: DateFormat.jm().format(_timeOfDayToDateTime(selectedTime!)!),
      suffixIcon: IconButton(
        onPressed: (){
          _selectTime(context, ref, selectedTime: selectedTime);
        },
        icon: const Icon(FontAwesomeIcons.clock),
      ),
      readOnly: true,
      onChanged: (value){
      },
    );
  }
  Future<void> _selectTime(BuildContext context,WidgetRef ref, {required TimeOfDay selectedTime}) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (picked != null) {
        ref.read(selectedTimeProvider.notifier).state = picked;
      }
    }
  DateTime? _timeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

}
