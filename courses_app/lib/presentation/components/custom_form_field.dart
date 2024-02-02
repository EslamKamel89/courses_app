import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum EntryType { email, username, passOne, passTwo, phone }

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.type,
    required this.controller,
    this.obsecureAllow = false,
    this.minLines,
    this.title,
    this.leadingIcon,
    this.suffixIcon,
    this.minChar = 5,
    this.maxChar = 20,
  });
  final TextEditingController controller;
  final bool obsecureAllow;
  final int? minLines;
  final String? title;
  final Icon? suffixIcon;
  final Icon? leadingIcon;
  final EntryType type;
  final int minChar;
  final int maxChar;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final regExpEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          padding: EdgeInsets.only(top: 23.h, bottom: 5.h),
          child: TextFormField(
            controller: widget.controller,
            validator: _validate,
            decoration: InputDecoration(
              hintText: _hint(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: !widget.obsecureAllow
                  ? widget.suffixIcon
                  : IconButton(
                      onPressed: () {
                        obsecure = !obsecure;
                        setState(() {});
                      },
                      icon: obsecure ? const Icon(Icons.remove_red_eye) : const Icon(Icons.visibility_off_outlined),
                    ),
              prefix: widget.leadingIcon,
            ),
            obscureText: widget.obsecureAllow == false ? false : obsecure,
            minLines: widget.obsecureAllow ? 1 : widget.minLines,
            maxLines: widget.obsecureAllow ? 1 : widget.minLines,
            keyboardType: widget.type == EntryType.phone ? TextInputType.phone : null,
            autocorrect: false,
          ),
        ),
        Positioned(
          left: 5,
          top: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: Colors.transparent,
            child: Txt.textFormFieldTitle(_title()),
          ),
        ),
      ],
    );
  }

  String? _validate(value) {
    switch (widget.type) {
      case EntryType.username:
        if (value == null || value.isEmpty) {
          return "Email field can't be empty";
        } else if (value.length < widget.minChar || value.length > widget.maxChar) {
          return '${'The Number Of Characters Should Be Between'} (${widget.minChar} , ${widget.maxChar}) ${'Characters'}';
        }
        break;
      case EntryType.email:
        if (value == null || value.isEmpty) {
          return "Email field can't be empty  ";
        } else if (!regExpEmail.hasMatch(value)) {
          return 'Email Not Valid';
        }
        break;
      case EntryType.phone:
        if (value == null || value.isEmpty) {
          return "Phone field can't be empty";
        }
        break;
      case EntryType.passOne:
      case EntryType.passTwo:
        if (value == null || value.isEmpty) {
          return "Password field can't be empty";
        } else if (value.length < widget.minChar || value.length > widget.maxChar) {
          return '${'The Number Of Characters Should Be Between'} (${widget.minChar} , ${widget.maxChar}) ${'Characters'}';
        }
        break;
      default:
    }
    return null;
  }

  String _title() {
    switch (widget.type) {
      case EntryType.username:
        return 'Username';
      case EntryType.email:
        return 'Email';
      case EntryType.phone:
        return 'Phone';
      case EntryType.passOne:
        return 'Password';
      case EntryType.passTwo:
        return 'Confirm Password';
      default:
    }
    return '';
  }

  String _hint() {
    switch (widget.type) {
      case EntryType.username:
        return 'Please Enter Your Username';
      case EntryType.email:
        return 'Please Enter Your Email';
      case EntryType.phone:
        return 'Please Enter Your Phone';
      case EntryType.passOne:
        return 'Please Enter Your Password';
      case EntryType.passTwo:
        return 'Please Enter Your Password Again';
      default:
    }
    return '';
  }
}
