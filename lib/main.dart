import 'package:dio_mvvm/ui/auth/login_page.dart';
import 'package:dio_mvvm/ui/detail/detail_page.dart';
import 'package:dio_mvvm/ui/main_page.dart';
import 'package:dio_mvvm/ui/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio_mvvm/di/injector.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:dio_mvvm/app/language_manager.dart';
// import 'app/constants.dart';
// import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  // await EasyLocalization.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
  //   runApp (
  //      EasyLocalization(
  //         supportedLocales: LanguageManager.instance!.supportedLocales,
  //         path: LANGUAGE_ASSETS_PATH,
  //         startLocale: LanguageManager.instance!.enLocale,
  //         child: MyApp()),
  //   );
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            title: "Dio MVVM",
            debugShowCheckedModeBanner: false,
          );
  }

  final GoRouter _router = GoRouter(
    initialLocation: MainPage.route,
    routes: <GoRoute>[
      GoRoute(
        path: MainPage.route,
        name: MainPage.route,
        builder: (BuildContext context, GoRouterState state) {
          return const MainPage();
        },
      ),
      GoRoute(
        path: ProfilePage.route,
        name: ProfilePage.route,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfilePage();
        },
      ),
      GoRoute(
        path: DetailPage.route,
        name: DetailPage.route,
        builder: (BuildContext context, GoRouterState state) {
          return const DetailPage();
        },
      ),
      GoRoute(
        path: LoginPage.route,
        name: LoginPage.route,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
    ],
  );
}
