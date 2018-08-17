class CodeSystem {
  int _id = null;
  String _codeSystemOid;
  String _displayName;
  int _organizationId;

  CodeSystem(
      this._id,
      this._codeSystemOid,
      this._displayName,
      this._organizationId);

  CodeSystem.noId(
      this._codeSystemOid,
      this._displayName,
      this._organizationId);


  factory CodeSystem.fromJson(Map<String, dynamic> codeSystem) =>
      CodeSystem(_toInt(codeSystem['id']), codeSystem['codeSystemOid'], codeSystem['displayName'], _toInt(codeSystem['organizationId']));

  static _toInt(id) => id is int ? id : int.parse(id);
  Map toJson() => {'id': id, 'codeSystemOid': codeSystemOid, 'displayName': displayName, 'organizationId': organizationId};


  int get id => _id;

  set id(int value) {
    _id = value;
  }


  String get codeSystemOid => _codeSystemOid;

  set codeSystemOid(String value) {
    _codeSystemOid = value;
  }


  int get organizationId => _organizationId;

  set organizationId(int value) {
    _organizationId = value;
  }


  String get displayName => _displayName;

  set displayName(String value) {
    _displayName = value;
  }



}

