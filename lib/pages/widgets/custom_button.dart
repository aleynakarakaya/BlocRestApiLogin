import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        height: 50.0,
        width: 300,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.red]),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(widget.text),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(0, 255, 255, 255),
          ),
        ));
  }
}
