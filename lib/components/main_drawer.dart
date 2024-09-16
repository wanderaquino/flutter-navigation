import 'package:cod3r_navigation/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTapAction) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapAction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).colorScheme.secondary,
          child: Text("Bora cozinhar",
              style:
                  TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).colorScheme.primary)),
        ),
        _createItem(Icons.restaurant, "Refeições",
                () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME) ),
        _createItem(Icons.settings, "Configurações",
                () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS))
      ]),
    );
  }
}
