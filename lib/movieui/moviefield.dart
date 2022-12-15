import 'package:flutter/material.dart';

class MovieField extends StatelessWidget {
  const MovieField(this.field,this.value,{Key? key}) : super(key: key);
  final String field;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field:", style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),),
        Expanded(
          child: Text(value, style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400
          ),),
        )
      ],
    );
  }
}
