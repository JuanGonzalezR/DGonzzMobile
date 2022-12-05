part of '../util/views_import.dart';

const Duration _kExpand = Duration(milliseconds: 200);

//*********************************************************************************************************************/

class IconBackMenu extends StatelessWidget {
  const IconBackMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Positioned(
      top: rsp.hp(5),
      left: rsp.wp(5),
      child: IconButton(
        icon: Icon(Icons.keyboard_double_arrow_left_rounded,
            size: rsp.dp(5), color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

//*********************************************************************************************************************/

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

//*********************************************************************************************************************/

class DesignTextField extends StatelessWidget {
  final String hint;
  final String label;
  final IconData iconoExterior;
  final Color iconColor;
  final Color backgroundColor;
  final Color cicleColor;
  final Function(String) onChange;
  final Function() onTap;
  final TextInputType textType;
  final String font;
  final bool disguise;

  const DesignTextField(
      this.hint,
      this.label,
      this.iconoExterior,
      this.iconColor,
      this.backgroundColor,
      this.cicleColor,
      this.onChange,
      this.onTap,
      this.textType,
      this.font,
      this.disguise,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      obscureText: disguise,
      keyboardType: textType,
      style: TextStyle(fontFamily: font),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: hint,
          labelText: label,
          icon: CircleAvatar(
            backgroundColor: backgroundColor,
            child: Icon(
              iconoExterior,
              color: cicleColor,
            ),
          )),
      onChanged: onChange,
    );
  }
}
