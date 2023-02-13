part of '../../util/views_import.dart';

//******************************************************************************************************************** */

class DesingLoginBaseBot extends StatelessWidget {
  const DesingLoginBaseBot({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _ClassForDesingLoginBaseBot(),
      ),
    );
  }
}

class _ClassForDesingLoginBaseBot extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Propiedades del lapiz
    lapiz.color = const Color.fromRGBO(33, 57, 112, 0.6); // Color
    lapiz.style = PaintingStyle.fill; // Estilo de relleno
    lapiz.strokeWidth = 5; // Grosor de lapiz

    final path = Path(); // Dibujo

    path.moveTo(0, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.60,
        size.width * 0.35, size.height * 0.80);
    path.quadraticBezierTo(
        size.width * 0.40, size.height * 0.95, size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//******************************************************************************************************************** */

class DesingLoginBaseBot2 extends StatelessWidget {
  const DesingLoginBaseBot2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _ClassForDesingLoginBaseBot2(),
      ),
    );
  }
}

class _ClassForDesingLoginBaseBot2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Propiedades del lapiz
    lapiz.color = const Color.fromRGBO(33, 0, 112, 0.7); // Color
    lapiz.style = PaintingStyle.fill; // Estilo de relleno
    lapiz.strokeWidth = 5; // Grosor de lapiz

    final path = Path(); // Dibujo

    path.moveTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width * 0.20, size.height * 0.95, size.width, size.height * 0.80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//******************************************************************************************************************** */

class DesingLoginBaseTop extends StatelessWidget {
  const DesingLoginBaseTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _ClassForDesingLoginBaseTop(),
      ),
    );
  }
}

class _ClassForDesingLoginBaseTop extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Propiedades del lapiz
    lapiz.color = const Color.fromRGBO(33, 0, 112, 0.5); // Color
    lapiz.style = PaintingStyle.fill; // Estilo de relleno
    lapiz.strokeWidth = 5; // Grosor de lapiz

    final path = Path(); // Dibujo

    path.quadraticBezierTo(size.width * 0.50, size.height * 0.05,
        size.width * 0.55, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.30, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//******************************************************************************************************************** */

class DesingLoginBaseTop2 extends StatelessWidget {
  const DesingLoginBaseTop2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _ClassForDesingLoginBaseTop2(),
      ),
    );
  }
}

class _ClassForDesingLoginBaseTop2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // Propiedades del lapiz
    lapiz.color = const Color.fromRGBO(33, 57, 112, 0.5); // Color
    lapiz.style = PaintingStyle.fill; // Estilo de relleno
    lapiz.strokeWidth = 5; // Grosor de lapiz

    final path = Path(); // Dibujo

    path.quadraticBezierTo(size.width * 0.30, size.height * 0.02,
        size.width * 0.47, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.30, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//******************************************************************************************************************** */

class FondoLogin extends StatelessWidget {
  const FondoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    //final rsp = Responsive(context);
    final fondoMorado = Container(
        height: double.infinity,
        width: double.infinity,
        decoration:
            const BoxDecoration(color: Color.fromARGB(235, 132, 183, 241)));

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: const Color.fromARGB(69, 255, 255, 255)),
    );

    return Stack(children: <Widget>[
      fondoMorado,
      Positioned(top: 90.0, left: 30.0, child: circulo),
      Positioned(top: -40.0, right: -30.0, child: circulo),
      Positioned(bottom: -50.0, right: -10.0, child: circulo),
      Positioned(top: 90.0, left: 30.0, child: circulo),
      Positioned(top: -40.0, right: -30.0, child: circulo),
      Positioned(bottom: -50.0, right: -10.0, child: circulo),
      Positioned(top: 150.0, right: 10.0, child: circulo),
    ]);
  }
}

//******************************************************************************************************************** */

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(
        side: BorderSide(
          color: Color.fromARGB(0, 255, 255, 255),
        ),
      ),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 250,
        height: 250,
        child: Image.asset(
          'asset/image/DGzz.png',
          width: 200,
        ),
      ),
    );
  }
}

//******************************************************************************************************************** */

class TitleLogin extends StatelessWidget {
  const TitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
          fontFamily: 'rimouski',
          fontSize: 35,
          color: Color.fromARGB(204, 33, 57, 112)),
    );
  }
}

//******************************************************************************************************************** */

class MessageTitleLogin extends StatelessWidget {
  const MessageTitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Personal Folder',
          style: TextStyle(
              fontFamily: 'Comfortaa-Bold',
              fontSize: 16,
              color: Color.fromARGB(204, 33, 57, 112)),
        ),
        Text(
          'Mobile Developer',
          style: TextStyle(
              fontFamily: 'Comfortaa-Light',
              fontSize: 14,
              color: Color.fromARGB(204, 33, 57, 112)),
        ),
        Text(
          'Juan Pablo Gonzalez',
          style: TextStyle(
              fontFamily: 'Comfortaa-Light',
              fontSize: 14,
              color: Color.fromRGBO(33, 57, 112, 0.8)),
        )
      ],
    );
  }
}

//******************************************************************************************************************** */

class MyButtonAboutLogin extends StatelessWidget {
  const MyButtonAboutLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        textStyle: const TextStyle(fontSize: 15, fontFamily: 'Comfortaa-Light'),
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
              )
            ),
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text('Photo'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.music_note),
                        title: const Text('Music'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              );
            });
      },
      child: const Text('About me'),
    );
  }
}

//******************************************************************************************************************** */

class MyButtonLogin extends StatelessWidget {
  const MyButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(33, 0, 112, 0.7),
                    Color.fromRGBO(33, 0, 112, 0.5),
                    Color.fromARGB(71, 34, 0, 112),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, navegarFadeIn(context, const ViewMenu()));
            },
            child: const Text('Continue', style: TextStyle(fontFamily: 'Comfortaa-Light'),),
          ),
        ],
      ),
    );
  }
}
