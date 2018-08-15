import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled2/models/category.dart';


class CategoryService {
  // static final _headers = {'Content-Type': 'application/json'};
  dynamic _extractData(Response resp) => json.decode(resp.body);
  static const _categoriesUrl = 'http://localhost:10447/valueSetCategory/all';
  final Client _http;
  CategoryService(this._http);
  Future<List<Category>> getAll() async {
      final response = await _http.get(_categoriesUrl);
      print(response.body);
      final categories = (_extractData(response) as List)
          .map((value) => Category.fromJson(value))
          .toList();
      print(categories);
      return categories;
}
}