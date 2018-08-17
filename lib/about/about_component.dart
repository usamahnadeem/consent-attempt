import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:vsm/_services/codedConcept_service.dart';
import 'package:angular/angular.dart';
import 'package:vsm/_services/category_service.dart';
import 'package:vsm/_services/code_system.service.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'about-page',
  styleUrls: ['about_component.css'],
  templateUrl: './about_component.html',
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
class AboutComponent implements OnInit {


  AboutComponent(
      );

  @override
  void ngOnInit() {
//    _getCategories();
//    _getCodedConcepts();
//    _getByOrganizationId(1);
  }

}

