part of '../../util/views_import.dart';

class ViewMenu extends StatelessWidget {
  const ViewMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(left: rsp.wp(5), top: rsp.hp(10),child: const IconDart()),
          Positioned(right: rsp.wp(5), top: rsp.hp(12),child: const IconFlutter()),
          Positioned(left: rsp.wp(45), top: rsp.hp(13.5),child: const IconKing()),
          const FondoBase2(),
          const FondoBase3(),
          Positioned(left: rsp.wp(35), top: rsp.hp(6),child: const TitleMenu()),
          Positioned(left: rsp.wp(5), top: rsp.hp(16),child: const TitleMenuWithLogo()),
          Positioned(left: rsp.wp(5), top: rsp.hp(28),child: const TableMenuOptions()),
        ],
      ),
    );
  }
}