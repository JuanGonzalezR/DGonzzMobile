part of '../../util/views_import.dart';

class ViewMenuBloc extends StatelessWidget {
  const ViewMenuBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: const [
            HeaderMenuBloc()
          ],
        ),
      ),
    );
  }
}