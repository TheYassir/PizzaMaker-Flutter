import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_maker/bloc/pizza/pizza_bloc.dart';
import 'package:pizza_maker/components/pizza_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PizzaAppbar(),
        body: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/data/img/hero.jpg'),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Votre compo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.red),
                    ),
                  ),
                  ListView.builder(
                      itemCount: state.pizza.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            state.pizza[index].image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(state.pizza[index].name),
                        );
                      }),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: const Text(
                          "Envoyer",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Ajouter des ingrédients",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.red),
                    ),
                  ),
                  ListView.builder(
                      itemCount: state.categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {
                              context.read<PizzaBloc>().add(
                                  LoadIngredientByCategory(
                                      categoryName: state.categories[index]));
                              context.push(
                                  '/ingredient/${state.categories[index]}');
                            },
                            child: Row(
                              children: [
                                Text(
                                  state.categories[index].replaceFirst(
                                    state.categories[index][0],
                                    state.categories[index][0].toUpperCase(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          },
        ));
  }
}
