class CodedConcept {
  int id;
  String code;
  String description;
  int codeSystemId;
  int valueSetId;

  CodedConcept(this.id, this.code, this.description, this.codeSystemId, this.valueSetId);


  factory CodedConcept.fromJson(Map<String, dynamic> codedconcept) =>
      CodedConcept(_toInt(codedconcept['id']), codedconcept['code'], codedconcept['description'], codedconcept['codeSystemId'], codedconcept['valueSetId'] );

  static _toInt(id) => id is int ? id : int.parse(id);
  Map toJson() => {'id': id, 'code': code, 'description': description, 'codeSystemId': codeSystemId, 'valueSetId': valueSetId};

}