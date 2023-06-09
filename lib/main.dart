import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linguasphere/presentation/courses_page.dart';
import 'package:linguasphere/presentation/detail_page.dart';
import 'package:linguasphere/presentation/faq_page.dart';
import 'package:linguasphere/presentation/lessons.dart';
import 'package:linguasphere/presentation/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:linguasphere/presentation/sign_in.dart';
import 'package:linguasphere/presentation/sign_up.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA7rq8sWniiP9jfWQ5BfvovKAVTJ87F3Mw",
          authDomain: "linguasphere.firebaseapp.com",
          projectId: "testcollegde",
          storageBucket: "testcollegde.appspot.com",
          messagingSenderId: "817448231558",
          appId: "1:817448231558:web:de1aad4bbffe58ef066707",
          measurementId: "G-J3DF1G87JV"

      )
  );
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  if (firebaseAuth is FirebaseAuthWeb){
    firebaseAuth.setPersistence(Persistence.SESSION);
  }
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state){
          return MainPage();
        }
      ),
      GoRoute(
          name: 'courses',
          path: '/courses',
          builder: (BuildContext context, GoRouterState state){
            return CoursesPage();
          },
        routes: [
          GoRoute(
              name: 'detail_page',
              path: 'course_:id',
              builder: (BuildContext context, GoRouterState state) => DetailPage(id: state.pathParameters['id']!,)
          ),
        ]
      ),
      GoRoute(
          name: 'signup',
          path: '/signup',
          builder: (BuildContext context, GoRouterState state){
            return SignUp();
          }
      ),
      GoRoute(
          name: 'signin',
          path: '/signin',
          builder: (BuildContext context, GoRouterState state){
            return SignIn();
          }
      ),
      GoRoute(
          name: 'faq',
          path: '/faq',
          builder: (BuildContext context, GoRouterState state){
            return FAQsPage();
          }
      ),
      GoRoute(
          name: 'lessons',
          path: '/lessons',
          builder: (BuildContext context, GoRouterState state){
            return LessonsPage();
          }
      ),


    ]
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp.router(
      title: 'LingvoLand',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      routerConfig: _router,


    );
  }
}
