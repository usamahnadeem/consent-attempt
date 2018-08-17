import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:vsm/_models/code_system.dart';
import 'package:vsm/_models/code_system_update_oid_request.dart';
import 'package:vsm/_models/code_system_update_display_request.dart';

class CodeSystemService {
  static final _headers = {'Content-Type': 'application/json'};
  dynamic _extractData(Response resp) => json.decode(resp.body);
  static const _categoriesUrl = 'http://localhost:10447/codeSystem';
  final Client _http;


  CodeSystemService(this._http);


  Future<CodeSystem> getById(int id) async {
    final response = await _http.get(_categoriesUrl + "/" + id.toString());
    print("CODE SYSTEM RESPONSE IS:" + response.body);
    final codeSystem = CodeSystem.fromJson(_extractData(response));
    print(codeSystem);
    return codeSystem;
  }
  Future<CodeSystem> save(CodeSystem codeSystem) async {
    final response = await _http.post(_categoriesUrl + "/save", body: json.encode(codeSystem), headers: _headers);
    print(response.body);
    final newCs = CodeSystem.fromJson(_extractData(response));
    return newCs;
  }

  Future<CodeSystem> updateOid(int csId, String newCodeSystemOid) async {
    CodeSystemOidUpdateRequest request = new CodeSystemOidUpdateRequest(newCodeSystemOid);
    final response = await _http.put(_categoriesUrl + "/update/oid/" + csId.toString(), body: json.encode(request), headers: _headers);
    print(response.body);
    final newCs = CodeSystem.fromJson(_extractData(response));
    return newCs;
  }

  Future<CodeSystem> updateDisplayName(int csId, String newCodeSystemDisplayName) async {
    CodeSystemDisplayUpdateRequest request = new CodeSystemDisplayUpdateRequest(newCodeSystemDisplayName);
    final response = await _http.put(_categoriesUrl + "/update/display/" + csId.toString(), body: json.encode(request), headers: _headers);
    print(response.body);
    final newCs = CodeSystem.fromJson(_extractData(response));
    return newCs;
  }
}