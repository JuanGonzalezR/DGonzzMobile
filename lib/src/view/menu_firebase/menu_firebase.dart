part of '../../util/views_import.dart';

class ViewMenuFirebase extends StatelessWidget {
  const ViewMenuFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: const [
            HeaderMenuFirebase()
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            BottonCreateNewRegister()
          ],
        ),
      ),
    );
  }
}