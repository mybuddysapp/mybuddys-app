import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isDisabled;

  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: isDisabled ? null : onTap,
          color: isDisabled ? Colors.grey : Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 42,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            text,
            style: Get.textTheme.button
          ),
        ),
      ],
    );
  }
}
