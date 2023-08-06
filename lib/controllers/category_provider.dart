import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category/category.dart';
import '../models/pagination/pagination.dart';
import '../services/api_services.dart';

final categoriesProvider = FutureProviderFamily<List<Category>?, PaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);

    return apiRepository.getCategories(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);
