import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/presentation/widgets/custom_text_field.dart';

class TaskTimePicker extends StatefulWidget {
  const TaskTimePicker({
    super.key,
  });

  @override
  State<TaskTimePicker> createState() => _TaskTimePickerState();
}

class _TaskTimePickerState extends State<TaskTimePicker> {

  TimeOfDay? selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      title: "Time",
      hintText: DateFormat.jm().format(_timeOfDayToDateTime(selectedTime!)!),
      suffixIcon: IconButton(
        onPressed: (){
          _selectTime(context);
        },
        icon: const Icon(FontAwesomeIcons.clock),
      ),
      readOnly: true,
      onChanged: (value){
      },
    );
  }
  DateTime? _timeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

}
