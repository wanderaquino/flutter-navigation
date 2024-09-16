import "package:cod3r_navigation/components/main_drawer.dart";
import "package:cod3r_navigation/models/settings.dart";
import "package:flutter/material.dart";

class SettingsScreen extends StatefulWidget {
  final void Function(Settings) handleChangeSettings;

  SettingsScreen({super.key, required this.handleChangeSettings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settings = Settings();

  Widget _createSwitch(String descTitle, String descSubtitle, bool value, Function(bool) onChangedFunction) {
    return SwitchListTile(
        title: Text(descTitle), subtitle: Text(descSubtitle), value: value, onChanged: onChangedFunction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Configurações",
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Expanded(
              child: ListView(
            children: [
              _createSwitch("Sem Gluten", "Só exibe refeições sem gluten", settings.isGlutenFree,
                  (value) => setState(
                          () {
                            settings.isGlutenFree = value;
                            widget.handleChangeSettings(settings);
                          }

                  )),
              _createSwitch("Só vegetarianas", "Só exibe refeições para vegetarianos", settings.isVegetarian,
                  (value) => setState(
                          () {
                        settings.isVegetarian = value;
                        widget.handleChangeSettings(settings);
                      }

                  )),
              _createSwitch("Só vegano", "Só exibe refeições para veganos", settings.isVegan,
                  (value) => setState(
                          () {
                        settings.isVegan = value;
                        widget.handleChangeSettings(settings);
                      }

                  )),
              _createSwitch("Sem lactose", "Só exibe refeições zero lactose", settings.isLactoseFree,
                      (value) => setState(
                              () {
                            settings.isLactoseFree = value;
                            widget.handleChangeSettings(settings);
                          }

                      ))
            ],
          ))
        ],
      ),
    );
  }
}
