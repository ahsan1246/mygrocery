import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mygrocery/utils/app_const.dart';
import '/configs/config.dart';
import '/utils/api_url.dart';

import '/models/category/category.dart';

final apiService = Provider((ref) => ApiService());

class ApiService {
  static var client = http.Client();

  // Category
  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var url = Uri.http(Config.baseUrl, ApiUrl.categoryAPI, queryString);

    var response = await client.get(url, headers: requestHeader);

    logger.d(
      'Request URL => ${response.request?.url}\n'
      'Response Status Code => ${response.statusCode}\n'
      'Response Body => ${response.body}.',
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return categoriesFromJson(data['data']);
    }
    return null;
  }
}
