import 'package:flutter/material.dart';
import 'package:hw_colletion/util/colors.dart';

class BorderTextField extends StatelessWidget {
  TextEditingController controller;
  final String hintText;

  BorderTextField({Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      // decoration: const BoxDecoration(color: ColorConstants.DARK),
      child: TextField(
          controller: controller,
          cursorColor: ColorConstants.WHITE,
          decoration: InputDecoration(

              // labelStyle: TextStyle(color: ColorConstants.WHITE),
              // labelText: 'Email',
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0),
              ),
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
              ),
              border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorConstants.PRIMARY, width: 1.0),
              ))),
    );
  }
}
