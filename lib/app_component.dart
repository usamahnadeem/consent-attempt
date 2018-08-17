import 'dart:async';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:untitled2/_models/category.dart';
import 'package:untitled2/_models/code_system.dart';

import 'package:angular/angular.dart';
import 'package:untitled2/_services/category_service.dart';
import 'package:untitled2/_services/code_system.service.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
    directives: [
      materialInputDirectives,
      MaterialCheckboxComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      MaterialButtonComponent,
      MaterialDialogComponent,
      FixedMaterialTabStripComponent,
      NgFor,
      NgIf,
      coreDirectives,
      formDirectives
    ],
  providers: [CategoryService, CodeSystemService]
)
class AppComponent implements OnInit {
  final CategoryService _categoryService;
  final CodeSystemService _codeSystemService;
  final List<String> tabLabels = ['Value Sets', 'About'];
  List<Category> _categories = [];
  List<CodeSystem> _codeSystems = [];

  AppComponent(
      this._categoryService,
      this._codeSystemService
      );

  @override
  void ngOnInit() {
//    _getCategories();
//    _getCodeSystemsById(1);
  }
  Future<void> _getCategories() async {
      _categories = await _categoryService.getAll();
  }

  Future<void> _getCodeSystemsById(int id) async {
    CodeSystem newCs = await _codeSystemService.getById(id);
    _codeSystems.add(newCs);
  }

  void mockUpdateCsDisplay(){
    _updateCodeSystemDisplayName(1, "Sean Updated the code System number 1 to this new display name");
  }

  void mockUpdateCsOid(){
    _updateCodeSystemOid(1, "Sean Updated the oid of number 1 to this new long string");
  }

  Future<void> _updateCodeSystemDisplayName(int id, String newCodeSystemDisplayName) async {
    CodeSystem newCs = await _codeSystemService.updateDisplayName(id, newCodeSystemDisplayName);
    _codeSystems.add(newCs);
  }

  Future<void> _updateCodeSystemOid(int id, String newCodeSystemOid) async {
    CodeSystem newCs = await _codeSystemService.updateOid(id, newCodeSystemOid);
    _codeSystems.add(newCs);
  }

  Future<void> newCat(cat) async{
    await _categoryService.save(cat);
    return;
  }
  Future<void> newCodeSystem(cs) async{
    CodeSystem myNewCs = await _codeSystemService.save(cs);
    codeSystems.add(myNewCs);
  }

  void mockNewCs(){
    CodeSystem myCat = new CodeSystem.noId("12345", "This is sean's new code system", 2);
    this.newCodeSystem(myCat);
  }

  void mockNewCat(){
    Category myCat = new Category(50, "1010", "hello hi", true, 1);
    this.newCat(myCat);
  }

  //SETTERS AND GETTERS

  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
  }
  List<CodeSystem> get codeSystems => _codeSystems;

  set codeSystems(List<CodeSystem> value) {
    _codeSystems = value;
  }
}


