import 'dart:async';
import 'package:untitled2/_models/category.dart';
import 'package:untitled2/_models/CodedConcept.dart';
import 'package:untitled2/_services/codedConcept_service.dart';
import 'package:angular/angular.dart';
import 'package:untitled2/_services/category_service.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives],
  providers: [CategoryService, CodedConceptService]
)
class AppComponent implements OnInit {
  final CategoryService _categoryService;
  final CodedConceptService _codedConceptService;
  List<Category> categories = [];
  List<CodedConcept> codedConcepts = [];
  List<CodedConcept> bayStateCodedConcepts = [];



  AppComponent(this._categoryService, this._codedConceptService);
  @override
  void ngOnInit() {
    _getCategories();
    _getCodedConcepts();
    _getByOrganizationId(1);
  }

  Future<void> _getCodedConcepts() async {
    codedConcepts = await _codedConceptService.getAll();
  }

  Future<void> _getCategories() async {
      categories = await _categoryService.getAll();
  }

  Future<void> _getByOrganizationId(id) async{
    List<CodedConcept> ccS = await _codedConceptService.getByOrganizationId(id);
    ccS.forEach((f) =>
      this.bayStateCodedConcepts.add(f)
    );
  }

  Future<void> newCat(cat) async{
    await _categoryService.save(cat);
    return;
  }

  void mockNewCat(){
    Category myCat = new Category(50, "1010", "hello hi", true, 1);
    this.newCat(myCat);
  }

  /////

  Future<void> newCodedConcept(codedConcept) async{
    await _codedConceptService.save(codedConcept);
    return;
  }

  void mockNewCodedConcept(){
    CodedConcept myCodedConcept = new CodedConcept(1, "123", "Hello, from Coded Concept", 1, 7 );
    this.newCodedConcept(myCodedConcept);
  }


}


