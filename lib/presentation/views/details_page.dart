import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/presentation/widgets/custom_text_field.dart';
import 'package:task_nest/presentation/widgets/default_button.dart';
import 'package:task_nest/presentation/widgets/task_date_picker.dart';
import 'package:task_nest/presentation/widgets/task_time_picker.dart';
import 'package:task_nest/utils/extensions.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, });
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=> Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22,)
        ),
        centerTitle: true,
        title: const Text('Add a new task'),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            CustomTextField(
              controller: TextEditingController(),
              title: "Task Title",
              hintText: "hint",
              onChanged: (value){
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: deviceSize.height * 0.02),
              child: const Row(
                children: [
                  Expanded(child:
                  TaskDatePicker(),
                  ),
                  Gap(15),
                  Expanded(child:
                  TaskTimePicker(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                title: "Note",
                hintText: "note",
                maxLines: 6,
                onChanged: (value){
                },
              ),
            ),
            DefaultButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
            },
                title: "Save"
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}


