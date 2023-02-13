part of 'views_import.dart';

Route navegarFadeIn (BuildContext context, Widget page){
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, _, child){
      return FadeTransition(
        opacity: Tween(begin: 0.0,end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut)
        ),
        child: child 
        );
    }
    );
}