import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/presentation/widgets/custom_text_field.dart';

class TaskDatePicker extends StatefulWidget {
  const TaskDatePicker({
    super.key,
  });

  @override
  State<TaskDatePicker> createState() => _TaskDatePickerState();
}

class _TaskDatePickerState extends State<TaskDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
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
      title: "Date",
      hintText: DateFormat('d/MM/yyyy').format(selectedDate),
      suffixIcon: IconButton(
        onPressed: (){
          _selectDate(context);
        },
        icon: const Icon(FontAwesomeIcons.calendar),
      ),
      readOnly: true,
      onChanged: (value){
      },
    );
  }
}
