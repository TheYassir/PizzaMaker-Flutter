import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class PizzaAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PizzaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          Text(
            'Pizza Maker',
          ),
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
