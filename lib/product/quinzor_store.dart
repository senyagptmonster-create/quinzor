import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuinzorStore extends ChangeNotifier {
  List<dynamic> scores = [];

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('quinzor_data');
    if (data != null) {
      final json = jsonDecode(data);
      scores = json['scores'] ?? [];
    } else {
      scores = [
        {"player": "Alice", "score": 1500},
        {"player": "Bob", "score": 1200}
      ];
    }
    notifyListeners();
  }
}
