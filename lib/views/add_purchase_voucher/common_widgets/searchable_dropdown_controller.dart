import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/imports/core_imports.dart';

class DropdownController extends GetxController {

  var filteredItems = <String>[].obs;
  var highlightedIndex = (-1).obs;

  // Method to filter items
  void filterItems(String query,List<String> items) {
    if (query.isNotEmpty) {
      filteredItems.value = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      highlightedIndex.value = -1;
    } else {
      filteredItems.clear();
    }
  }

  // Method to select an item
  void selectItem(String item) {
    // Your logic to handle item selection
  }

  // Method to handle key events
  KeyEventResult handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        highlightedIndex.value = (highlightedIndex.value + 1) % filteredItems.length;
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        highlightedIndex.value = highlightedIndex.value > 0
            ? highlightedIndex.value - 1
            : filteredItems.length - 1;
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.enter) {
        if (highlightedIndex.value != -1) {
          selectItem(filteredItems[highlightedIndex.value]);
          return KeyEventResult.handled;
        }
        return KeyEventResult.handled;
      }

    }
    return KeyEventResult.ignored;
  }
}
