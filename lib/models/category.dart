class Category {
  int id;
  String code;
  String description;
  bool isFederal;
  int organization_id;

  Category(this.id, this.code, this.description, this.isFederal,
      this.organization_id);

  factory Category.fromJson(Map<String, dynamic> category) =>
      Category(_toInt(category['id']), category['code'], category['description'], category['isFederal'], category['organization_id'] );

  static _toInt(id) => id is int ? id : int.parse(id);

}
//  int getId(){
//  return this.id;
//  }
//  void setId(id){
//  this.id = id;
//  }
//  String getCode(){
//  return this.code;
//  }
//  void setCode(code){
//  this.code = code;
//  }
//  String getDescription(){
//  return this.description;
//  }
//  void setDescription(description){
//  this.description = description;
//  }
//  bool getIsFederal(){
//  return this.isFederal;
//  }
//
//  void setIsFederal(isFederal){
//  this.isFederal = isFederal;
//  }
//
//  int getOrganization_id(){
//  return this.organization_id;
//  }
//
//  void setOrganization_id(){
//  this.organization_id = organization_id;
//  }


