import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorTxt;
  const AppError({super.key, this.errorTxt = ''});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: errorTxt.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorTxt,
          style: const TextStyle(color: Colors.red, fontSize: 18.0),
        ),
      ),
    );
  }
}
