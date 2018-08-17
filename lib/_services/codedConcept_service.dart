import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:http/http.dart';
import 'package:vsm/_models/CodedConcept.dart';

@Injectable()
class CodedConceptService {
  static final _headers = {'Content-Type': 'application/json'};
  dynamic _extractData(Response resp) => json.decode(resp.body);
  static const _codedConceptUrl = 'http://localhost:10447/codedConcept';
  final Client _http;

  CodedConceptService(this._http);
  Future<List<CodedConcept>> getAll() async {
    final response = await _http.get(_codedConceptUrl + "/all");
    print(response.body);
    final codedconcepts = (_extractData(response) as List)
        .map((value) => CodedConcept.fromJson(value))
        .toList();
    print(codedconcepts);
    return codedconcepts;
  }

  Future<List<CodedConcept>> getByOrganizationId(id) async {
    final response = await _http.get(_codedConceptUrl + "/organization/" + id.toString());
    print(response.body);
    final codedconcepts = (_extractData(response) as List)
        .map((value) => CodedConcept.fromJson(value))
        .toList();
    print(codedconcepts);
    return codedconcepts;
  }

  Future<CodedConcept> save(CodedConcept newCodedConcept) async {
    final response = await _http.post(_codedConceptUrl + "/save", body: json.encode(newCodedConcept), headers: _headers);
    print(response.body);
    final codedconcept = CodedConcept.fromJson(_extractData(response));
    print(codedconcept);
    return codedconcept;
  }


}



/*
  Hi, Im just a useless comment
 */