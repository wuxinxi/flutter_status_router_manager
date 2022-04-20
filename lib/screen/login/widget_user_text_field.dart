import 'package:flutter/material.dart';

import '../../utils/font_utils.dart';

///
/// @date: 2022/4/8 23:12
/// @author: TangRen
/// @remark:
///
class UserTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final bool? autofocus;
  final Widget? icon;
  final bool suffixIcon;
  final String? hintText;
  final bool obscureText;

  const UserTextField(
      {Key? key,
      this.controller,
      this.focusNode,
      this.textInputAction,
      this.onSubmitted,
      this.autofocus,
      this.icon,
      this.suffixIcon = false,
      this.hintText,
      this.obscureText = false})
      : super(key: key);

  @override
  _UserTextFieldState createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  var obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: const EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0), color: Colors.white),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onSubmitted: widget.onSubmitted,
        autofocus: widget.autofocus ?? false,
        maxLines: 1,
        obscureText: obscureText,
        style: const TextStyle(
            fontSize: 17.0,
            fontFamily: Font.quicksandMedium,
            color: Color(0xFF4b4b4b)),
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: widget.icon,
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon
                ? InkWell(
                    child: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF4b4b4b),
                    ),
                    onTap: () => {setState(() => obscureText = !obscureText)},
                  )
                : null),
      ),
    );
  }
}
