import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/business.dart';

class BusinessWidget extends StatefulWidget {
  const BusinessWidget({super.key});

  @override
  State<BusinessWidget> createState() {
    return _BusinessWidgetState();
  }
}

class _BusinessWidgetState extends State<BusinessWidget> {
  late Future<Business> _business;
  @override
  void initState() {
    _business = fetchData('test/businesses.json');
  }

  Future<Business> fetchData(String url) async {
    try {
      final response = await rootBundle.loadString(url);
      final jsonData = jsonDecode(response.toString());
      return Business.fromJSON(jsonData);
    } catch (e) {
      throw Exception('Failed to load Business data');
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        body: FutureBuilder<Business>(
            future: _business,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54),
                    child: Text(data.name));
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text('Failed to load Business data.'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
    return scaffold;
  }
}
