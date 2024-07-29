import 'package:flutter/material.dart';

typedef SearchChangedCallback = void Function(int index, String value);

class SearchBarText extends StatelessWidget {
  final List<TextEditingController> controllers;
  final SearchChangedCallback onChanged;

  const SearchBarText({super.key, required this.controllers, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        children: List.generate(controllers.length, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                controller: controllers[index],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Search ${index + 1}',
                ),
                onChanged: (value) {
                  onChanged(index, value);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
