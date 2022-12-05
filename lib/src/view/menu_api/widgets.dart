part of '../../util/views_import.dart';

//*********************************************************************************************************************/

class HeaderMenuApi extends StatelessWidget {
  const HeaderMenuApi({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                width: double.infinity,
                height: rsp.hp(37),
                decoration: const BoxDecoration(
                    color:  Color.fromARGB(200, 255, 82, 82)),
                child: Center(
                  child: Image.asset(
                      width: rsp.dp(20),
                      height: rsp.dp(20),
                      'asset/image/api.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: SizedBox(width: double.infinity, height: rsp.hp(38)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: rsp.wp(35), right: rsp.wp(35), top: rsp.wp(25)),
            width: rsp.wp(30),
            height: rsp.wp(30),
            child: Card(
              elevation: 5,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('asset/image/api.png'),
              ),
            ),
          ),
          Positioned.fill(
            top: rsp.hp(32),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
            ),
          ),
          const IconBackMenu(),
          const ListViewDataApi()
        ],
      ),
    );
  }
}



//*********************************************************************************************************************/

class ListViewDataApi extends StatelessWidget {
  const ListViewDataApi({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    final List<String> items = List<String>.generate(20, (i) => '$i');
    return Container(
        margin:
            EdgeInsets.only(left: rsp.wp(4), right: rsp.wp(4), top: rsp.hp(35)),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0, bottom: 5),
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, i) {
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 211, 211, 211),
                    child: Text(
                      items[i],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text('Item ${items[i]}'),
                  subtitle: const Text('Item description'),
                  trailing: const Icon(Icons.cleaning_services),
                  onTap: () {},
                ),
              );
            },
          ),
        ));
  }
}

//*********************************************************************************************************************/
