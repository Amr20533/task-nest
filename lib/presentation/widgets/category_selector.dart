import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task_nest/providers/category_provider.dart';
import 'package:task_nest/utils/task_categories.dart';
import 'package:task_nest/utils/extensions.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 20),),
          const Gap(10),
          Expanded(child: ListView.separated(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: (){
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: category.color.withOpacity(0.3),
                        border: Border.all(width: 2, color: category == selectedCategory ? context.colorScheme.primary : category.color)
                    ),
                    child: Center(
                      child: Icon(category.icon, color: category == selectedCategory ? context.colorScheme.primary : category.color.withOpacity(0.5),),
                    ),

                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(8)
          )
          )

        ],
      ),
    );
  }
}
