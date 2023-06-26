part of '../util/views_import.dart';

const Duration _kExpand = Duration(milliseconds: 200);
int _backgroundColor = 0x42000000;
int _seconds = 2;
bool _clickClose = true;
bool _allowClick = true;
bool _crossPage = true;
int _animationMilliseconds = 350;
int _animationReverseMilliseconds = 350;
BackButtonBehavior _backButtonBehavior = BackButtonBehavior.none;

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
          Navigator.of(context).pushAndRemoveUntil(
              navegarFadeIn(context, const ViewMenu()),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
//*********************************************************************************************************************/

showMyDialog(BuildContext context, String title, String subtitle,
    Function()? onPressedCan, Function()? onPressedOk) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(subtitle),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressedCan,
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: onPressedOk,
            child: const Text('Accept'),
          ),
        ],
      );
    },
  );
}


//*********************************************************************************************************************/

showNotifyLoading(Function()? functionClose) {
  return BotToast.showLoading(
      clickClose: _clickClose,
      allowClick: _allowClick,
      crossPage: _crossPage,
      backButtonBehavior: _backButtonBehavior,
      animationDuration: Duration(milliseconds: _animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: _animationReverseMilliseconds),
      duration: Duration(
        seconds: _seconds,
      ),
      backgroundColor: Color(_backgroundColor),
      onClose: functionClose);
}

//*********************************************************************************************************************/

Widget snackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
      content:
          Text(text, style: const TextStyle(fontFamily: 'Comfortaa-Light')));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  return snackBar;
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

Widget alertDialogProgress(
    BuildContext context, String title, String subtitle) {
  return AlertDialog(
    title: Text(title),
    titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Comfortaa-Light'),
    actionsOverflowButtonSpacing: 20,
    content: Row(children: [
      const CircularProgressIndicator(),
      const SizedBox(
        width: 10,
      ),
      Text(
        subtitle,
        style: const TextStyle(fontFamily: 'Comfortaa-Light'),
      ),
    ]),
  );
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
