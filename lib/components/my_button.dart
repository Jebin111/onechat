import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

  final String text;
  final void Function()?onTap;

  const MyButton({super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade100,width: 3),
        fixedSize: Size(MediaQuery.of(context).size.width-40, 60),
          backgroundColor: Colors.green
      ),
        onPressed: onTap,
        child: Text(text,style: TextStyle(
            color: Colors.grey.shade100,
            fontSize: 20),),
      );

  }
}
