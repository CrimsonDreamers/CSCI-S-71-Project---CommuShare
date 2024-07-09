import 'package:commushare_front/model/item.dart';
import 'package:commushare_front/service/database.dart';
import 'package:commushare_front/views/home.dart';
import 'package:commushare_front/views/loaning_view.dart';
import 'package:commushare_front/views/login.dart';
import 'package:commushare_front/views/login_wrapper.dart';
import 'package:commushare_front/views/view_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    databaseService: DatabaseService(),
  ));
}

class MyApp extends StatelessWidget {
  final DatabaseService databaseService;

  const MyApp({super.key, required this.databaseService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CommuShare',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ((settings) => RouteGenerator.generateRoute(settings)),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'poppins',
        useMaterial3: true,
      ),
      home: SplashScreenWrapper(databaseService: databaseService),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case '/home':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Home(
                  databaseService: DatabaseService(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
      case '/login':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Login(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });

      case '/loan_item':
        if(settings.arguments!=null) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                CreateItemView(databaseService: settings.arguments as DatabaseService),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
        }else {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                CreateItemView(databaseService: DatabaseService()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });}

      case '/view_item':
        if(settings.arguments!=null) {
          var argumentsList = settings.arguments as List;
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ViewItemView(item: argumentsList[0] as Item, databaseService: argumentsList[1] as DatabaseService),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
        } else {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Home(
                  databaseService: DatabaseService(),
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
