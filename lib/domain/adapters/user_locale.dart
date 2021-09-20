import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_locale.g.dart';

@HiveType(typeId: 1)
class UserLocale extends HiveObject implements Locale {
  @HiveField(0)
  @override
  final String? scriptCode;

  @override
  @HiveField(1)
  final String? countryCode;

  @override
  @HiveField(2)
  final String languageCode;

  UserLocale({this.scriptCode, this.countryCode, required this.languageCode});

  @override
  String toLanguageTag() {
    return '';
  }
}
