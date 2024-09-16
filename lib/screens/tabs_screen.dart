import "package:cod3r_navigation/components/main_drawer.dart";
import 'package:flutter/material.dart';
import "categories_screen.dart";
import "favorite_screen.dart";

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {"title": "Lista de Categorias", "screen": const CategoriesScreen()},
    {"title": "Lista de Favoritos", "screen": const FavoriteScreen()}
  ];

  _selectScreen(int index) {
      setState(() {
        _selectedScreenIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"] as String),
      ),
      body: _screens[_selectedScreenIndex]["screen"] as Widget,
      drawer: MainDrawer(),
      bottomNavigationBar:
        BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(

                icon: Icon(Icons.category),
                label: "Categorias"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favoritos")
          ],
        ),
    );
  }
}
