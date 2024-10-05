import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/presentation/views/details_page.dart';
import 'package:task_nest/presentation/widgets/custom_container.dart';
import 'package:task_nest/presentation/widgets/default_button.dart';
import 'package:task_nest/presentation/widgets/display_large_text.dart';
import 'package:task_nest/providers/task_provider_controller_imp.dart';
import 'package:task_nest/services/notifications/notification_service.dart';
import 'package:task_nest/utils/extensions.dart';
import 'package:task_nest/utils/task_categories.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskControllerProviderImp);



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
                    CustomContainer(
                      tasks: taskState.tasks,
                    ),
                    const Gap(20),
                    Text("Completed", style: context.textTheme.headlineMedium),
                    const Gap(20),
                    CustomContainer(
                      tasks: taskState.tasks,
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


