// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class ApiErrorModel {
  String message;
  int statusCode;
  IconData icon;
  ApiErrorModel({
    required this.message,
    required this.statusCode,
    required this.icon,
  });
}
