// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/donator_information.dart';
import '../login_screen.dart';
import 'package:flutter_application_6/models/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem(this.title, this.color);

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return donatorInformation();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
