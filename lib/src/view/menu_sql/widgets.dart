part of '../../util/views_import.dart';

//*********************************************************************************************************************/

class HeaderMenuSql extends StatefulWidget {
  const HeaderMenuSql({super.key});

  @override
  State<HeaderMenuSql> createState() => _HeaderMenuSqlState();
}

class _HeaderMenuSqlState extends State<HeaderMenuSql>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    final crud = EntActivityCRUD();
    final bloc = Provider.ofSQFliteBloc(context);
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
                    color: Color.fromARGB(200, 68, 137, 255)),
                child: Center(
                  child: Image.asset(
                    width: rsp.dp(20),
                    height: rsp.dp(20),
                    'asset/image/bd.png',
                  ),
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
          Positioned(
              top: rsp.hp(5.9),
              right: rsp.wp(5),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 15, fontFamily: 'Comfortaa-Light'),
                ),
                onPressed: () {
                  crud.countActivities().then((value) => {
                        if (value > 0)
                          {
                            showMyDialog(context, 'Alert delete',
                                'Do you want to delete all data?', (() {
                              Navigator.pop(context);
                            }), (() {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return alertDialogProgress(
                                        context,
                                        'Deleting data..',
                                        'Wait a moment please...');
                                  });

                              Future.delayed(const Duration(seconds: 3), () {
                                setState(() {
                                  crud.deleteAllActivity();
                                  setState(() {});
                                  Navigator.of(context).pushAndRemoveUntil(
                                      navegarFadeIn(
                                          context, const ViewMenuSql()),
                                      (Route<dynamic> route) => false);
                                });
                              });
                            }))
                          }
                        else
                          {snackBar(context, 'No data to delete')}
                      });
                },
                child: const Text('Delete all'),
              )),
          ListViewDataSql(bloc: bloc, entActivity: crud, rsp: rsp),
        ],
      ),
    );
  }
}

//*********************************************************************************************************************/

class ListViewDataSql extends StatefulWidget {
  final Responsive rsp;
  final EntActivityCRUD entActivity;
  final SQFliteBloc bloc;

  const ListViewDataSql(
      {Key? key,
      required this.rsp,
      required this.entActivity,
      required this.bloc})
      : super(key: key);

  @override
  State<ListViewDataSql> createState() => _ListViewDataSqlState();
}

class _ListViewDataSqlState extends State<ListViewDataSql> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: widget.rsp.wp(4),
            right: widget.rsp.wp(4),
            top: widget.rsp.hp(35)),
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: FutureBuilder(
                future: widget.entActivity.loadActivities(),
                builder: ((context,
                    AsyncSnapshot<List<EntExportActivity>> snapshot) {
                  if (snapshot.hasData) {
                    List<EntExportActivity> data = snapshot.data!;
                    if (data.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 0, bottom: 5),
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  circleLeading(data[i].actStatus),
                                ],
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    data[i].actName,
                                    style: const TextStyle(
                                        fontFamily: 'Comfortaa-Bold'),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Text(data[i].actDescription,
                                      style: const TextStyle(
                                          fontFamily: 'Comfortaa-Light')),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              trailing: SizedBox(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              widget.entActivity.deleteActivity(
                                                  data[i].actId);
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                                Icons.delete_sweep_rounded)),
                                        IconButton(
                                            onPressed: () {
                                              showMyDialogUpdate(
                                                  context,
                                                  widget.bloc,
                                                  'Update data',
                                                  data[i], () {
                                                Navigator.pop(context);
                                              }, () {
                                                _buttonUpdateAct(
                                                    widget.bloc,
                                                    widget.entActivity,
                                                    data[i].actId);
                                                widget.bloc
                                                    .changeActNameUpd('');
                                                widget.bloc
                                                    .changeActDescripUpd('');
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        navegarFadeIn(context,
                                                            const ViewMenuSql()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              });
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons
                                                .system_update_alt_rounded))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    return const Center(
                        child: Text("No data to view",
                            style: TextStyle(
                                fontFamily: 'ComickBook_Simple',
                                color: Colors.black54)));
                  }
                }))));
  }
}

Widget circleLeading(String data) {
  if (data == "Completed") {
    return const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 59, 74, 206),
      child: Icon(Icons.beenhere_rounded),
    );
  } else if (data == "Finished") {
    return const CircleAvatar(
      backgroundColor: Color.fromARGB(162, 223, 240, 77),
      child: Icon(Icons.workspace_premium),
    );
  } else {
    return const CircleAvatar(
      backgroundColor: Color.fromARGB(158, 223, 60, 60),
      child: Icon(Icons.work_off),
    );
  }
}

showMyDialogUpdate(BuildContext context, SQFliteBloc bloc, String title,
    EntExportActivity data, Function()? onPressedCan, Function()? onPressedOk) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: bloc.actDescripUpdStream,
                  builder: (context, snapshot) {
                    return DesignTextField(
                        "Name",
                        data.actName,
                        Icons.tips_and_updates_rounded,
                        Colors.white,
                        const Color.fromARGB(255, 211, 211, 211),
                        Colors.white, (v) {
                      bloc.changeActNameUpd(v);
                    }, () {}, TextInputType.emailAddress, 'Comfortaa-Light',
                        false);
                  }),
              const SizedBox(height: 10),
              StreamBuilder(
                  stream: bloc.actDescripUpdStream,
                  builder: (context, snapshot) {
                    return DesignTextField(
                        "Description",
                        data.actDescription,
                        Icons.description,
                        Colors.white,
                        const Color.fromARGB(255, 211, 211, 211),
                        Colors.white, (v) {
                      bloc.changeActDescripUpd(v);
                    }, () {}, TextInputType.emailAddress, 'Comfortaa-Light',
                        false);
                  }),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressedCan,
            child: const Text('Cancel'),
          ),
          StreamBuilder(
              stream: bloc.submitValidUpd,
              builder: (context, snapshot) {
                return TextButton(
                  onPressed: snapshot.hasData ? onPressedOk : null,
                  child: const Text('Update'),
                );
              }),
        ],
      );
    },
  );
}

//*********************************************************************************************************************/

class BottonCreateNewRegisterSql extends StatefulWidget {
  const BottonCreateNewRegisterSql({super.key});

  @override
  State<BottonCreateNewRegisterSql> createState() =>
      _BottonCreateNewRegisterSqlState();
}

class _BottonCreateNewRegisterSqlState
    extends State<BottonCreateNewRegisterSql> {
  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    final crud = EntActivityCRUD();
    final sqfl = SQFliteBloc();
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
                  bottonSheetNewRegister(context, rsp, crud, sqfl);
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

  Future<dynamic> bottonSheetNewRegister(BuildContext context, Responsive rsp,
      EntActivityCRUD crud, SQFliteBloc sqfl) {
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                        StreamBuilder(
                            stream: sqfl.actNameStream,
                            builder: (context, snapshot) {
                              return DesignTextField(
                                  "",
                                  'Activity name',
                                  Icons.tips_and_updates_rounded,
                                  Colors.white,
                                  const Color.fromARGB(255, 211, 211, 211),
                                  Colors.white, (v) {
                                sqfl.changeActName(v);
                              }, () {}, TextInputType.emailAddress,
                                  'Comfortaa-Light', false);
                            }),
                        SizedBox(height: rsp.dp(2)),
                        StreamBuilder(
                            stream: sqfl.actDescripStream,
                            builder: (context, snapshot) {
                              return DesignTextField(
                                  "",
                                  'Activity description',
                                  Icons.description,
                                  Colors.white,
                                  const Color.fromARGB(255, 211, 211, 211),
                                  Colors.white, (v) {
                                sqfl.changeActDescrip(v);
                              }, () {}, TextInputType.emailAddress,
                                  'Comfortaa-Light', false);
                            }),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 211, 211, 211),
                              child: Icon(
                                Icons.playlist_add_check_circle,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 18),
                            Text(
                              'Activity Status',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa-Bold',
                                  fontSize: 16,
                                  color: Colors.black54),
                            )
                          ],
                        ),
                        RadioButtonSql(bloc: sqfl),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder(
                                stream: sqfl.submitValid,
                                builder: (context, snapshot) {
                                  return ElevatedButton(
                                    onPressed: snapshot.hasData
                                        ? () {
                                            _buttonAddAct(sqfl, crud);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ViewMenuSql()),
                                            );
                                            //int res = await crud.countActivities();
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Comfortaa-Bold'),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )));
  }
}

_buttonAddAct(SQFliteBloc bloc, EntActivityCRUD activityCRUD) {
  String? actName = bloc.getActNameBloc;
  String? actDescrip = bloc.getActDescripBloc;
  String? actStatus = bloc.getActStatusBloc;

  actStatus ??= 'SingingCharacter.completed';

  if (actStatus.contains('completed')) actStatus = 'Completed';
  if (actStatus.contains('finished')) actStatus = 'Finished';
  if (actStatus.contains('cancelled')) actStatus = 'Cancelled';

  final entActivity = EntExportActivity(
      actName: actName, actDescription: actDescrip, actStatus: actStatus);

  activityCRUD.insertActivity(entActivity);
}

_buttonUpdateAct(SQFliteBloc bloc, EntActivityCRUD activityCRUD, int? id) {
  String? actNameUpd = bloc.getActNameUpdBloc;
  String? actDescripUpd = bloc.getActDescripUpdBloc;
  String? actStatusUpd = bloc.getActStatusBloc;

  actStatusUpd ??= 'SingingCharacter.completed';

  if (actStatusUpd.contains('completed')) actStatusUpd = 'Completed';
  if (actStatusUpd.contains('finished')) actStatusUpd = 'Finished';
  if (actStatusUpd.contains('cancelled')) actStatusUpd = 'Cancelled';

  final entActivity = EntExportActivity(
      actName: actNameUpd,
      actDescription: actDescripUpd,
      actStatus: actStatusUpd);

  activityCRUD.updateActivity(id, entActivity);
}

//*********************************************************************************************************************/

enum SingingCharacter { completed, finished, cancelled }

class RadioButtonSql extends StatefulWidget {
  final SQFliteBloc bloc;

  const RadioButtonSql({Key? key, required this.bloc}) : super(key: key);

  @override
  RadioButtonSqlState createState() => RadioButtonSqlState();
}

class RadioButtonSqlState extends State<RadioButtonSql> {
  SingingCharacter? _character = SingingCharacter.completed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.actStatusStream,
        builder: ((context, snapshot) {
          return Column(
            children: <Widget>[
              ListTile(
                title: const Text('Completed'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.completed,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      widget.bloc.changeActStatus(value.toString());
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
                      widget.bloc.changeActStatus(value.toString());
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
                      widget.bloc.changeActStatus(value.toString());
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          );
        }));
  }
}



//*********************************************************************************************************************/

