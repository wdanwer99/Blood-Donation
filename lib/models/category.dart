// ignore: file_names
// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.red,
  });
}
