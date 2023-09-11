import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_maker/bloc/pizza/pizza_bloc.dart';
import 'package:pizza_maker/components/pizza_appbar.dart';

class IngredientPage extends StatelessWidget {
  final String? categoryName;

  const IngredientPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PizzaAppbar(),
      body: BlocBuilder<PizzaBloc, PizzaState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    categoryName!.replaceFirst(
                      categoryName![0],
                      categoryName![0].toUpperCase(),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.red),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.ingredientsByCategory.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          context.read<PizzaBloc>().add(AddIngredient(
                              ingredient: state.ingredientsByCategory[index]));
                          context.go('/');
                        },
                        leading: Image.asset(
                          state.ingredientsByCategory[index].image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(state.ingredientsByCategory[index].name),
                      );
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
