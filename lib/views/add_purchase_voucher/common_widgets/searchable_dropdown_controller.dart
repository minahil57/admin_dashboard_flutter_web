import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/imports/core_imports.dart';

class DropdownController extends GetxController {

  var filteredItems = <String>[].obs;
  var highlightedIndex = (-1).obs;

  final ScrollController scrollController = ScrollController();


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
  void selectItem(String item,TextEditingController controller,ValueChanged<String?> onChanged) {
    controller.text = item;
    onChanged(item);

  }

  // Method to handle key events
  KeyEventResult handleKeyEvent(FocusNode node, KeyEvent event,TextEditingController controller,ValueChanged<String?> onChanged) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        highlightedIndex.value = (highlightedIndex.value + 1) % filteredItems.length;
        _scrollToIndex(); // Scroll to the highlighted item
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        highlightedIndex.value = highlightedIndex.value > 0
            ? highlightedIndex.value - 1
            : filteredItems.length - 1;
        _scrollToIndex(); // Scroll to the highlighted item
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.enter) {
        if (highlightedIndex.value != -1) {
          selectItem(filteredItems[highlightedIndex.value],controller,onChanged);
          return KeyEventResult.handled;
        }
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  void _scrollToIndex() {
    final itemHeight = 60.0; // Assuming each item has a height of 50.0
    final offset = highlightedIndex.value * itemHeight;
    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }


}
