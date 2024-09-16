import "package:flutter/material.dart";
import "../models/meal.dart";

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge));
  }

  Widget _createSectionText(BuildContext context, Widget child) {
    return Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(height: 300, width: double.infinity, child: Image.network(meal.imageUrl, fit: BoxFit.cover)),
            _createSectionTitle(context, "Ingredientes"),
            _createSectionText(
                context,
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(meal.ingredients[index]),
                        ));
                  },
                )),
            _createSectionTitle(context, "Passos"),
            _createSectionText(
                context,
                ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              child: Text("${index + 1}"),
                            ),
                            title: Text(meal.steps[index]),
                          ),
                          const Divider()
                        ],
                      );
                    }))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.favorite),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ));
  }
}
