part of '../../util/views_import.dart';

class ViewMenuSql extends StatelessWidget {
  const ViewMenuSql({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: const [HeaderMenuSql()],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [BottonCreateNewRegisterSql()],
        ),
      ),
    );
  }
}
