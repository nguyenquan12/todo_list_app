import 'package:flutter/material.dart';
import 'package:todo_list_app/extensions/colors.dart';
import 'package:todo_list_app/utils/constrants.dart';

Widget Vertical_small = const SizedBox(height: 20);

Widget Vertical_medium = const SizedBox(height: 50);

Widget Vertical_large = SizedBox(height: 80);

Widget Loading() {
  return Center(
    child: Image.asset(
      gif_loader,
      color: primaryButtonColor,
      height: 60,
      width: 60,
    ),
  );
}
