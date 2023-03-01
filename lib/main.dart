import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_request/features/edite/pages/bloc/edite_bloc.dart';
import 'package:http_request/features/home/pages/bloc/home_bloc.dart';

import 'features/create/pages/bloc/create_bloc.dart';
import 'features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => CreateBloc(),),
          BlocProvider(create: (BuildContext context) => HomeBloc(),),
          BlocProvider(create: (BuildContext context) => EditeBloc(),),
        ],
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:HomPage(),
    ),
      );
  }
}
