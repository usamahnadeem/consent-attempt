class CodeSystemOidUpdateRequest {
  //PROPERTIES
  String _codeSystemOid;

  //DEFAULT CONSTRUCTOR
  CodeSystemOidUpdateRequest(
      this._codeSystemOid);

  //FACTORY CONSTRUCTORS
  factory CodeSystemOidUpdateRequest.fromJson(Map<String, dynamic> codeSystem) =>
      CodeSystemOidUpdateRequest(codeSystem['codeSystemOid']);

  Map toJson() => {'codeSystemOid': codeSystemOid};

  //SETTERS AND GETTERS
  String get codeSystemOid => _codeSystemOid;

  set codeSystemOid(String value) {
    _codeSystemOid = value;
  }

}





