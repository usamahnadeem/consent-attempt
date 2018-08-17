import 'dart:async';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:untitled2/_models/category.dart';
import 'package:untitled2/_models/code_system.dart';
import 'package:untitled2/_models/CodedConcept.dart';
import 'package:untitled2/_services/codedConcept_service.dart';
import 'package:angular/angular.dart';
import 'package:untitled2/_services/category_service.dart';
import 'package:untitled2/_services/code_system.service.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'value-sets',
  styleUrls: ['valueSets_component.css'],
  templateUrl: './valueSets_component.html',
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
  providers: [CategoryService, CodeSystemService, CodedConceptService]
)
class ValueSetsComponent implements OnInit {
  final CategoryService _categoryService;
  final CodeSystemService _codeSystemService;
  final CodedConceptService _codedConceptService;

  List<Category> _categories = [];
  List<CodeSystem> _codeSystems = [];
  List<CodedConcept> codedConcepts = [];
  List<CodedConcept> bayStateCodedConcepts = [];

  ValueSetsComponent(
      this._categoryService,
      this._codeSystemService,
      this._codedConceptService
      );

  @override
  void ngOnInit() {
//    _getCategories();
//    _getCodedConcepts();
//    _getByOrganizationId(1);
  }

  Future<void> _getCodedConcepts() async {
    codedConcepts = await _codedConceptService.getAll();
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


  List<Category> get categories => _categories;

  set categories(List<Category> value) {
    _categories = value;
  }
  List<CodeSystem> get codeSystems => _codeSystems;

  set codeSystems(List<CodeSystem> value) {
    _codeSystems = value;
  }

  Future<void> newCodedConcept(codedConcept) async{
    await _codedConceptService.save(codedConcept);
    return;
  }

  void mockNewCodedConcept(){
    CodedConcept myCodedConcept = new CodedConcept(1, "123", "Hello, from Coded Concept", 1, 7 );
    this.newCodedConcept(myCodedConcept);
  }
}

