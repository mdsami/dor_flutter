import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget otpInput({
  required double height,
  required double width,
  required BuildContext context,
  required TextEditingController codeController,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: codeController,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
