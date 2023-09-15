import 'dart:convert';

import 'package:biometric_auth/providers/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    FutureProvider.family<String, LoginCredentials>((ref, log) async {
  final response =
      await http.post(Uri.parse('http://10.0.2.2:3001/api/v1/user/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': log.email,
            'password': log.password,
          }));

  return response.statusCode.toString();

  // if (response.statusCode == 200) {
  //   print(response.body);
  //   return response.body;
  // } else {
  //   print(response.statusCode);
  //   return response.statusCode.toString();
  // }
});