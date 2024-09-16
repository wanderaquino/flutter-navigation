import 'package:cod3r_navigation/screens/categories_meals_screen.dart';
import 'package:cod3r_navigation/screens/meal_datail_screen.dart';
import 'package:cod3r_navigation/screens/settings.dart';
import "package:cod3r_navigation/screens/tabs_screen.dart";

import 'package:cod3r_navigation/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import "data/dummy_data.dart";
import 'models/settings.dart';

void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _allMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    setState(() {
      _allMeals = dummyMeals.where((meal) {
        final bool glutenFilter = settings.isGlutenFree && !meal.isGlutenFree;
        final bool veganFilter = settings.isVegan && !meal.isVegan;
        final bool vegetarianFilter = settings.isVegetarian && !meal.isVegetarian;
        final bool lactoseFilter = settings.isLactoseFree && !meal.isLactoseFree;

        return !glutenFilter && !veganFilter && !vegetarianFilter && !lactoseFilter;

      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(meals: _allMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(handleChangeSettings: _filterMeals,)
      },
    );
  }
}
