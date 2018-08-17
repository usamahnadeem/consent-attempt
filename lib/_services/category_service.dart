import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:vsm/_models/category.dart';


class CategoryService {
  static final _headers = {'Content-Type': 'application/json'};
  dynamic _extractData(Response resp) => json.decode(resp.body);
  static const _categoriesUrl = 'http://localhost:10447/valueSetCategory';
  final Client _http;


  CategoryService(this._http);


  Future<List<Category>> getAll() async {
      final response = await _http.get(_categoriesUrl + "/all");
      print(response.body);
      final categories = (_extractData(response) as List)
          .map((value) => Category.fromJson(value))
          .toList();
      print(categories);
      return categories;
}
  Future<Category> save(Category newCategory) async {
    final response = await _http.post(_categoriesUrl + "/save", body: json.encode(newCategory), headers: _headers);
    print(response.body);
    final category = Category.fromJson(_extractData(response));
    print(category);
    return category;
  }
}