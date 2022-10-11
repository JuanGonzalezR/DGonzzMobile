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
            Color.fromARGB(214, 25, 0, 83),
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
    return const Text('Main Menu', style: TextStyle(fontSize: 35, fontFamily: 'chubby', color: Color.fromARGB(200, 255, 255, 255)));
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
        width:65,
        child: Image.asset(
          'asset/image/king.png',
          color: const Color.fromARGB(197, 3, 35, 105),
        ),
      ),
    );
  }
}
