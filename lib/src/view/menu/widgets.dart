part of '../../util/views_import.dart';

//******************************************************************************************************************** */

class FondoBase extends StatelessWidget {
  const FondoBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 241, 241, 241),
    );
  }
}

//******************************************************************************************************************** */

class FondoBase2 extends StatelessWidget {
  const FondoBase2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(255, 15, 0, 51),
            Color.fromARGB(183, 25, 0, 83),
            Color.fromARGB(195, 34, 0, 112),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        width: double.infinity,
        height: double.infinity);
  }
}

//******************************************************************************************************************** */

class FondoBase3 extends StatelessWidget {
  const FondoBase3({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            width: double.infinity,
            height: rsp.hp(75))
      ],
    );
  }
}

//******************************************************************************************************************** */

class IconDart extends StatelessWidget {
  const IconDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/image/dart.png',
      width: 100,
    );
  }
}

//******************************************************************************************************************** */

class IconFlutter extends StatelessWidget {
  const IconFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/image/flutter.png',
      width: 100,
    );
  }
}

//******************************************************************************************************************** */

class TitleMenu extends StatelessWidget {
  const TitleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Main Menu',
        style: TextStyle(
            fontSize: 35,
            fontFamily: 'chubby',
            color: Color.fromARGB(200, 255, 255, 255)));
  }
}

//******************************************************************************************************************** */

class TitleMenuWithLogo extends StatelessWidget {
  const TitleMenuWithLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 100,
          child: Image.asset(
            'asset/image/DGzz.png',
            width: 200,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Juan Gonzalez",
                style: TextStyle(color: Colors.white, fontFamily: 'rimouski')),
            Text("Flutter Project",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 8,
                    fontFamily: 'Comfortaa-Light')),
            Text("Mobile Developer",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 8,
                    fontFamily: 'Comfortaa-Light'))
          ],
        ),
      ],
    );
  }
}

//******************************************************************************************************************** */

class IconKing extends StatelessWidget {
  const IconKing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / -6,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 65,
        child: Image.asset(
          'asset/image/king.png',
          color: const Color.fromARGB(197, 3, 35, 105),
        ),
      ),
    );
  }
}

//******************************************************************************************************************** */

class DesingCardView extends StatelessWidget {
  final Color color;
  final Function()? onTap;
  final String routeImg;
  final String title;
  final String subtitle;
  final String description;

  const DesingCardView({
    super.key,
    required this.color,
    required this.onTap,
    required this.routeImg,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final rps = Responsive(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: rps.wp(40),
            height: rps.wp(40),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.transparent,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(176, 158, 158, 158),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  width: rps.wp(40),
                  height: rps.wp(40),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                ),
                Container(
                  width: rps.wp(39),
                  height: rps.wp(40),
                  margin: const EdgeInsets.only(left: 5),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(226, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                Container(
                  width: rps.wp(12),
                  height: rps.wp(12),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                      routeImg,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontFamily: 'rimouski')),
                      Text(subtitle,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontFamily: 'Comfortaa-Light')),
                      Text(description,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontFamily: 'Comfortaa-Light'))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

//******************************************************************************************************************** */

class TableMenuOptions extends StatelessWidget {
  const TableMenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          DesingCardView(
              color: const Color.fromARGB(200, 255, 214, 64),
              onTap: () {
                debugPrint('First Button');
              },
              routeImg: 'asset/image/firebase.png',
              title: 'Firebase',
              subtitle: 'Cloud platform for web and mobile application development',
              description: ''),
          DesingCardView(
              color: const Color.fromARGB(200, 255, 82, 82),
              onTap: () {
                debugPrint('Second Button');
              },
              routeImg: 'asset/image/api.png',
              title: 'API',
              subtitle: 'Application Programming Interface',
              description: '')
        ]),
        TableRow(children: [
          DesingCardView(
              color: const Color.fromARGB(200, 105, 240, 175),
              onTap: () {
                debugPrint('Third Button');
              },
              routeImg: 'asset/image/bloc.png',
              title: 'BLoC',
              subtitle: 'Business Logic Component',
              description: ''),
          DesingCardView(
              color: const Color.fromARGB(200, 68, 137, 255),
              onTap: () {
                debugPrint('Fourth Button');
              },
              routeImg: 'asset/image/bd.png',
              title: 'SQLite',
              subtitle: 'Stand-alone, highly reliable, embedded SQL database engine',
              description: '')
        ])
      ],
    );
  }
}
