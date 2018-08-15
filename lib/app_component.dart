import 'dart:async';
import 'package:untitled2/models/category.dart';

import 'package:angular/angular.dart';
import 'package:untitled2/services/category_service.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
  providers: [CategoryService]
)
class AppComponent implements OnInit {
  final CategoryService _categoryService;
  List<Category> categories = [];

  AppComponent(this._categoryService);
  @override
  void ngOnInit() => _getCategories();
  Future<void> _getCategories() async {
      categories = await _categoryService.getAll();
  }
}


