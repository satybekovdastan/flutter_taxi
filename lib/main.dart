import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:merphy/src/data/datasources/export_datasources.dart';
import 'package:merphy/src/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:merphy/src/data/datasources/remote/auth/auth_remote_data_source_impl.dart';
import 'package:merphy/src/data/repositories/export_repository_impls.dart';
import 'package:merphy/src/domain/repositories/auth/auth_repository.dart';
import 'package:merphy/src/domain/repositories/export_repositories.dart';
import 'package:merphy/src/domain/usecases/auth/auth_usecases.dart';
import 'package:merphy/src/domain/usecases/export_usecases.dart';
import 'package:merphy/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:merphy/src/presentation/cubit/auth/verify/verify_cubit.dart';
import 'package:merphy/src/presentation/cubit/export_news_cubits.dart';
import 'package:merphy/src/presentation/view/auth/auth_page.dart';
import 'package:merphy/src/utils/logger.dart';
import 'package:merphy/src/utils/token_manager.dart';

import 'src/core/network/dio_client.dart';
import 'src/presentation/view/news_page.dart';

part './src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter Demo',
       theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
       ),
       home: getFirstPage()
     );
   }

  Widget getFirstPage() {
     final token = SharedPreferencesManager().getToken();
     logger.e("token: $token");
     if (token != null) {
       return MyHomePage();
     } else {
       return AuthPage();
     }
   }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        title:  Text("News"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // await bloc.refresh();
        },
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // context.pushNamed(AppRoute.news.name);
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsPage(),
                    ));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

