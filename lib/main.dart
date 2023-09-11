import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pizza_maker/bloc/pizza/pizza_bloc.dart';
import 'routing/pizza_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PizzaBloc>(
      create: (context) {
        PizzaBloc pizzaBloc = PizzaBloc();

        pizzaBloc.add(LoadIngredientsEvent());
        return pizzaBloc;
      },
      child: MaterialApp.router(
        title: "Pizza Maker",
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
        ),
        routerConfig: PizzaRouter.router,
      ),
    );
  }
}
