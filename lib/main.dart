import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'models/resume.dart';
import 'viewmodels/git_hub_view_model.dart';
import 'viewmodels/resume_view_model.dart';
import 'viewmodels/theme_view_model.dart';
import 'repository/github_repository.dart';
import 'services/github_service.dart';

import 'pages/listofpeople.dart';
import 'pages/homepage.dart';
import 'pages/aboutme.dart';
import 'pages/myhobbies.dart';
import 'pages/currentsituation.dart';
import 'pages/githubstats.dart';
import 'pages/newresume.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final gitHubService = GitHubService();
  final gitHubRepo = GitHubRepository(gitHubService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GitHubViewModel(gitHubRepo),
        ),
        ChangeNotifierProvider(
          create: (_) => ResumeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ListOfPeoplePage(),
        ),
        GoRoute(
          path: '/homepage',
          builder: (context, state) {
            final resume = state.extra as Resume;
            return Homepage(resume: resume);
          },
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) {
            final resume = state.extra as Resume;
            return AboutMe(resume: resume);
          },
        ),
        GoRoute(
          path: '/hobbies',
          builder: (context, state) {
            final resume = state.extra as Resume;
            return MyHobbies(resume: resume);
          },
        ),
        GoRoute(
          path: '/current-situation',
          builder: (context, state) {
            final resume = state.extra as Resume;
            return MySituation(resume: resume);
          },
        ),
        GoRoute(
          path: '/github-stats',
          builder: (context, state) {
            final resume = state.extra as Resume;
            return GithubStats(resume: resume);
          },
        ),
        GoRoute(
          path: '/newresume',
          builder: (context, state) {
            final template = state.extra as Resume?;
            return NewResume(template: template);
          },
        ),
      ],
    );

    return MaterialApp.router(
      title: 'About Me App',
      routerConfig: router,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 167, 196),
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            backgroundColor: const Color.fromARGB(255, 245, 181, 218),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            backgroundColor: const Color.fromARGB(255, 100, 100, 100),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
          ),
        ),
      ),
      themeMode: context.watch<ThemeViewModel>().isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}