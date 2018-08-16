import 'dart:async';
import 'package:untitled2/_models/category.dart';

import 'package:angular/angular.dart';
import 'package:untitled2/_services/category_service.dart';


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

  Future<void> newCat(cat) async{
    await _categoryService.save(cat);
    return;
  }

  void mockNewCat(){
    Category myCat = new Category(50, "1010", "hello hi", true, 1);
    this.newCat(myCat);
  }
}


