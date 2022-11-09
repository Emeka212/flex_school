import 'package:flutter/material.dart';
import 'package:flex_school/theme/theme.dart';

//======================================================================
// PUBLIC APP BAR WIDGET
//======================================================================
class PublicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String title;
  const PublicAppBar({super.key, required this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? AppTheme().primaryColor,
      title: Text(title),
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size(kToolbarHeight, kToolbarHeight);
}

//======================================================================
// PUBLIC TEXT FEILD WIDGET
//======================================================================
class PublicTextFeild extends StatelessWidget {
  final String hint;
  final Widget suffixIcon;
  final TextEditingController controller;
  const PublicTextFeild({
    super.key,
    required this.hint,
    required this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: AppTheme().lightDark,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintStyle: const TextStyle(fontSize: 14.0, height: 1.6),
        ),
      ),
    );
  }
}

//======================================================================
// PUBLIC TEXT BUTTON WIDGET
//======================================================================
class PublicTextButton extends StatelessWidget {
  final String value;
  final ValueChanged onPressed;
  const PublicTextButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme().primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        child: PublicTextWidget(
          text: value,
          color: AppTheme().lightDark,
        ),
        onPressed: () => onPressed(''),
      ),
    );
  }
}

//======================================================================
// PUBLIC ICON BUTTON WIDGET
//======================================================================
class PublicIconButton extends StatelessWidget {
  final Widget icon;
  final ValueChanged onPressed;
  const PublicIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed,
      icon: icon,
    );
  }
}

//======================================================================
// PUBLIC TEXT BUTTON WIDGET
//======================================================================
class PublicTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeignt;
  const PublicTextWidget({
    super.key,
    this.color,
    this.fontSize,
    this.fontWeignt,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeignt ?? FontWeight.normal,
        fontSize: fontSize ?? 15.0,
        color: color ?? AppTheme().textColor,
      ),
    );
  }
}

//======================================================================
// PUBLIC CKECK BOX WIDGET
//======================================================================
class PublicCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onPressed;
  const PublicCheckBox({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.0,
      width: 16.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: Checkbox(
          onChanged: (bool? val) => onPressed(val as bool),
          value: value,
        ),
      ),
    );
  }
}

//=========================================================
// PUBLIC SNACKBAR WIDGET
//=========================================================
class PublicSnackBar extends SnackBar {
  const PublicSnackBar({
    Key? key,
    required super.content,
    super.margin = const EdgeInsets.all(15.0),
    super.behavior = SnackBarBehavior.floating,
    super.backgroundColor = const Color(0xff1e1c24),
  }) : super(key: key);
}
