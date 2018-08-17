class CodeSystemDisplayUpdateRequest {
  //PROPERTIES
  String _codeSystemDisplay;

  //DEFAULT CONSTRUCTOR
  CodeSystemDisplayUpdateRequest(
      this._codeSystemDisplay
      );

  //FACTORY CONSTRUCTORS
  factory CodeSystemDisplayUpdateRequest.fromJson(Map<String, dynamic> codeSystem) =>
      CodeSystemDisplayUpdateRequest(codeSystem['codeSystemDisplay']);


  Map toJson() => {'displayName': _codeSystemDisplay};

  //SETTERS AND GETTERS

  String get codeSystemDisplay => _codeSystemDisplay;

  set codeSystemDisplay(String value) {
    _codeSystemDisplay = value;
  }


}





