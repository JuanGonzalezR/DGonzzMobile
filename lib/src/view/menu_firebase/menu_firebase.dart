part of '../../util/views_import.dart';

class ViewMenuFirebase extends StatelessWidget {
  const ViewMenuFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: const Stack(
          children: [
            HeaderMenuFirebase()
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BottonCreateNewRegister()
          ],
        ),
      ),
    );
  }
}