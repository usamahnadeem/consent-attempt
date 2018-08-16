class CodedConcept {
  int id;
  String code;
  String description;
  bool isFederal;
  int organization_id;

  CodedConcept( this.code, this.description, this.isFederal,
      this.organization_id);

}