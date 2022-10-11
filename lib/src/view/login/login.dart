part of '../../util/views_import.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Scaffold(
      body: Stack(
        children: [
          const DesingLoginBaseBot2(),
          const DesingLoginBaseBot(),
          const DesingLoginBaseTop2(),
          const DesingLoginBaseTop(),
          Positioned(left: rsp.wp(21), top: rsp.hp(32),child: const LogoLogin()),
          Positioned(left: rsp.wp(5), top: rsp.hp(8),child: const TitleLogin()),
          Positioned(left: rsp.wp(5), top: rsp.hp(14),child: const MessageTitleLogin()),
          Positioned(right: rsp.wp(3), top: rsp.hp(6),child: const MyButtonAboutLogin()),
          Positioned(right: rsp.wp(5), bottom: rsp.hp(22),child: const MyButtonLogin()),
          ],
      ),
    );
  }
}
