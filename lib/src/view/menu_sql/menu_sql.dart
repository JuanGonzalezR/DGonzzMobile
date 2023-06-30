part of '../../util/views_import.dart';

class ViewMenuSql extends StatelessWidget {
  const ViewMenuSql({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: const Stack(
          children: [HeaderMenuSql()],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [BottonCreateNewRegisterSql()],
        ),
      ),
    );
  }
}
