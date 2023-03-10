import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text('horray'),);     //SnackBar seems to be a variable that is naturally a part of flutter.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } ,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('Push Me!'),
      ),
    );
  }
}
