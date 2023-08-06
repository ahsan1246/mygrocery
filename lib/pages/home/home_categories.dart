import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/category_provider.dart';
import '../../models/pagination/pagination.dart';
import '/models/category/category.dart';
import '/utils/app_text_styles.dart';

class HomeCategories extends ConsumerWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('All Categories', style: AppTextStyles.style18Bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _categoriesList(ref),
        ),
      ],
    );
  }

  Widget _categoriesList(WidgetRef ref) {
    final categories = ref.watch(
      categoriesProvider(
        PaginationModel(
          page: 1,
          pageSize: 10,
        ),
      ),
    );

    // categories.when
    return categories.when(
      data: (catList) => _buildCategoryList(catList!),
      error: (err, __) => Center(
        child: Text('Error: $err'),
      ),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }

  Widget _buildCategoryList(List<Category> category) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          var data = category[index];
          return GestureDetector(
            onTap: () {
              debugPrint('Tab on category');
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: data.fullCategoryImagePath.isNotEmpty
                        ? Image.network(data.fullCategoryImagePath, height: 50)
                        : const SizedBox.shrink(),
                  ),
                  Row(
                    children: [
                      Text(data.categoryName, style: AppTextStyles.style12Bold),
                      const Icon(Icons.keyboard_arrow_right_rounded, size: 13),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
