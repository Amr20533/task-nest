import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/presentation/views/details_page.dart';
import 'package:task_nest/presentation/widgets/custom_container.dart';
import 'package:task_nest/presentation/widgets/default_button.dart';
import 'package:task_nest/presentation/widgets/display_large_text.dart';
import 'package:task_nest/services/notifications/notification_service.dart';
import 'package:task_nest/utils/extensions.dart';
import 'package:task_nest/utils/task_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                decoration: BoxDecoration(
                  color: colors.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Gap(30),
                    Text(DateFormat.yMMMd().format(DateTime.now()), style: context.textTheme.headlineSmall!.copyWith(color: colors.surface, fontSize: 20),),
                    DisplayLargeText(text: 'My todo List'),

                  ],
                ),
              ),
              // Expanded(child: Container(
              //   width: deviceSize.width,
              //   color: colors.secondary,
              // )),

            ],
          ),
          Positioned(
            top: deviceSize.height * 0.15,
            right: 0,
            left: 0,
            // bottom: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const CustomContainer(
                      tasks: [
                        TaskModel(
                          title: 'Math Homework',
                          note: 'Complete exercises 1 to 10 on page 42.',
                          time: '2:00 PM',
                          date: '2024-10-06',
                          category: TaskCategories.education,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Gym Session',
                          note: 'Focus on cardio and weight training.',
                          time: '5:30 PM',
                          date: '2024-10-06',
                          category: TaskCategories.health,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Grocery Shopping',
                          note: 'Buy fruits, vegetables, and snacks.',
                          time: '10:00 AM',
                          date: '2024-10-07',
                          category: TaskCategories.shopping,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Doctor Appointment',
                          note: 'Annual check-up at 3 PM.',
                          time: '3:00 PM',
                          date: '2024-10-08',
                          category: TaskCategories.health,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Family Gathering',
                          note: 'Dinner at Grandma’s house.',
                          time: '6:00 PM',
                          date: '2024-10-09',
                          category: TaskCategories.home,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Book Flight',
                          note: 'Plan trip to Paris for next month.',
                          time: '1:00 PM',
                          date: '2024-10-10',
                          category: TaskCategories.travel,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Project Deadline',
                          note: 'Submit the project report by Friday.',
                          time: '12:00 PM',
                          date: '2024-10-11',
                          category: TaskCategories.work,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Social Media Update',
                          note: 'Post vacation photos on Instagram.',
                          time: '8:00 PM',
                          date: '2024-10-12',
                          category: TaskCategories.social,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Read a Book',
                          note: 'Finish reading "The Alchemist".',
                          time: '7:00 PM',
                          date: '2024-10-13',
                          category: TaskCategories.others,
                          isCompleted: false,
                        ),
                        TaskModel(
                          title: 'Clean the House',
                          note: 'Organize living room and kitchen.',
                          time: '10:30 AM',
                          date: '2024-10-14',
                          category: TaskCategories.home,
                          isCompleted: false,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text("Completed", style: context.textTheme.headlineMedium),
                    const Gap(20),
                    CustomContainer(
                      tasks: [
                        TaskModel(
                          title: 'Math Homework',
                          note: 'Complete exercises 1 to 10 on page 42.',
                          time: '2:00 PM',
                          date: '2024-10-06',
                          category: TaskCategories.education,
                          isCompleted: true,
                        ),
                      ],
                      isComplete: true,
                    ),
                    const Gap(20),
                    DefaultButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                    },
                      title: "Add a New Task"),
                    const Gap(20),
              
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
  void _showNotification() {

    print('Showing notification...');
    NotificationService().showNotification(
      id: 0,
      title: 'Hello!',
      body: 'This is a test notification.',
    );
  }
  void _showScheduledNotification() {

    print('Showing Scheduled notification...');
    NotificationService().scheduleNotification(
      id: 0,
      title: 'Hello!',
      body: 'This is a test notification.',
      scheduledDate: DateTime.now().add(const Duration(seconds: 3))
    );
  }

}


