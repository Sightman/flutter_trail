import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Requestor {
  static const _baseUrl = "https://api.spacexdata.com/v4/";

  Future<http.Response> getData({
    required String endpoint,
    String? id,
    Object? query,
    Map<String, String>? header,
  }) {
    if (id != null) {
      return getById(endpoint, id);
    } else if (query != null) {
      return postMethod(endpoint, query, header!);
    }
    return getMethod(endpoint);
  }

  Future<http.Response> getMethod(String endpoint) async {
    final url = "$_baseUrl$endpoint";
    return await http.get(Uri(path: url));
  }

  Future<http.Response> getById(String endpoint, String id) async {
    final url = "$_baseUrl$endpoint/$id";
    return await http.get(Uri(path: url));
  }

  Future<http.Response> postMethod(
    String endpoint,
    Object query,
    Map<String, String>? header,
  ) async {
    final url = "$_baseUrl$endpoint/query";

    header = header ??
        {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
    return await http.post(
      Uri(path: url),
      body: query,
      headers: header,
    );
  }

  Future<List<dynamic>> arrayFromAssets(String filename) async {
    try {
      var json = await rootBundle.loadString(filename);
      return jsonDecode(json) as List<dynamic>;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>?> itemFromAssets(String filename, id) async {
    try {
      var json = await rootBundle.loadString(filename);
      List<dynamic> array = jsonDecode(json);
      var result =
          array.map((e) => e.id == id ? e : null) as Map<String, dynamic>;
      return result;
    } catch (e) {
      throw e.toString();
    }
  }
}
