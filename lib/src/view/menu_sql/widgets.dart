part of '../../util/views_import.dart';

//*********************************************************************************************************************/

class HeaderMenuSql extends StatelessWidget {
  const HeaderMenuSql({super.key});

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
                    color:  Color.fromARGB(200, 68, 137, 255)),
                child: Center(
                  child: Image.asset(
                      width: rsp.dp(20),
                      height: rsp.dp(20),
                      'asset/image/bd.png',),
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
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('asset/image/bd.png'),
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
          const ListViewDataSql()
        ],
      ),
    );
  }
}



//*********************************************************************************************************************/

class ListViewDataSql extends StatelessWidget {
  const ListViewDataSql({super.key});

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

class BottonCreateNewRegisterSql extends StatelessWidget {
  const BottonCreateNewRegisterSql({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 85, 130, 228),
            maxRadius: 30,
            child: IconButton(
                onPressed: () {
                  bottonSheetNewRegister(context, rsp);
                },
                icon: const Icon(
                  Icons.add_circle_sharp,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottonSheetNewRegister(BuildContext context, Responsive rsp) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.all(rsp.dp(3)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Register the activity here',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa-Bold',
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(height: rsp.dp(5)),
                        DesignTextField(
                            "",
                            'Activity name',
                            Icons.tips_and_updates_rounded,
                            Colors.white,
                            const Color.fromARGB(255, 211, 211, 211),
                            Colors.white,
                            (v) {},
                            () {},
                            TextInputType.emailAddress,
                            'Comfortaa-Light',
                            false),
                        SizedBox(height: rsp.dp(2)),
                        DesignTextField(
                            "",
                            'Activity description',
                            Icons.description,
                            Colors.white,
                            const Color.fromARGB(255, 211, 211, 211),
                            Colors.white,
                            (v) {},
                            () {},
                            TextInputType.emailAddress,
                            'Comfortaa-Light',
                            false),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 211, 211, 211),
                            child: Icon(
                              Icons.playlist_add_check_circle,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 18),
                          Text('Activity Status', style: TextStyle(fontFamily: 'Comfortaa-Bold', fontSize: 16, color: Colors.black54),)
                          ],
                        ),
                        const RadioButtonSql(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Comfortaa-Bold'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              )
              
            ));
  }
}

//*********************************************************************************************************************/


enum SingingCharacter { completed, finished, cancelled }

class RadioButtonSql extends StatefulWidget {
  const RadioButtonSql({super.key});

  @override
  State<RadioButtonSql> createState() => _RadioButtonSqlState();
}

class _RadioButtonSqlState extends State<RadioButtonSql> {
  SingingCharacter? _character = SingingCharacter.completed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Completed'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.completed,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Finished'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.finished,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Cancelled'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.cancelled,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}