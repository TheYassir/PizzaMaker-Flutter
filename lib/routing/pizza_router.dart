import 'package:go_router/go_router.dart';
import 'package:pizza_maker/pages/ingredient_page.dart';
import '../pages/home_page.dart';

class PizzaRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'ingredient/:categoryName',
          builder: (context, state) => IngredientPage(
              categoryName: state.pathParameters['categoryName']),
        )
      ],
    )
  ]);
}
