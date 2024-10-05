import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task_nest/models/task_state_model.dart';
import 'package:task_nest/presentation/widgets/category_selector.dart';
import 'package:task_nest/presentation/widgets/custom_text_field.dart';
import 'package:task_nest/presentation/widgets/default_button.dart';
import 'package:task_nest/presentation/widgets/task_date_picker.dart';
import 'package:task_nest/presentation/widgets/task_time_picker.dart';
import 'package:task_nest/providers/task_provider_controller_imp.dart';
import 'package:task_nest/utils/extensions.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({super.key,});

  static DetailsPage builder(BuildContext context, GoRouterState state) => const DetailsPage();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateConsumerStatefulWidget();
}

class _CreateConsumerStatefulWidget  extends ConsumerState<DetailsPage>{
  @override
  Widget build(BuildContext context) {
    final taskProvider = ref.watch(taskControllerProviderImp);
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
              controller: ref.read(taskControllerProviderImp.notifier).titleController,
              title: "Task Title",
              hintText: "hint",
              onChanged: (value){
              },
            ),
            const CategorySelector(),
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
                controller: ref.read(taskControllerProviderImp.notifier).noteController,
                title: "Note",
                hintText: "note",
                maxLines: 6,
                onChanged: (value){
                },
              ),
            ),
            DefaultButton(onPressed: ()async{
              // _createTask(taskProvider: taskProvider);
            },
                title: "Save"
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  // void _createTask({required TaskStateModel taskProvider}) async{
  //   final title = taskProvider.titleController.trim();
  //   final note = taskProvider.noteController.trim();
  //
  //   if(title.isEmpty){
  //     debugPrint("Empty Title");
  //   }
  //
  // }

}


