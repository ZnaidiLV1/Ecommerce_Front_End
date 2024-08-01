import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendproject/core/constant/colors.dart';

// ignore: must_be_immutable
class textField extends StatefulWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
   bool showData;
  TextInputType? keyboardtype;
  final TextEditingController? mycontroller;

  textField(
      {super.key,
      required this.keyboardtype,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller,
      required this.showData});

  @override
  State<textField> createState() => _textFieldState();
}

class _textFieldState extends State<textField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        controller: widget.mycontroller,
        keyboardType: widget.keyboardtype,
        obscureText: !widget.showData,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(widget.labeltext),
          ),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                widget.showData = !widget.showData;
              });
            },
            child: Icon(
              widget.iconData,
              color: ConstColors.primarycolor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: ConstColors.primarycolor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: ConstColors.primarycolor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: ConstColors.primarycolor),
          ),
        ),
      ),
    );
  }
}
