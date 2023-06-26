part of '../../util/views_import.dart';

class ViewMenuBloc extends StatelessWidget {
  const ViewMenuBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: [
            const HeaderMenuBloc(),
            Positioned(left: rsp.wp(5), top: rsp.hp(35),child: const TableMenuOptionsBloc()),
          ],
        ),
      ),
    );
  }
}