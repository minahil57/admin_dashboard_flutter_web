import 'package:flutter/material.dart';
import 'package:getx_admin_panel/core/theme/text_style.dart';
import 'package:getx_admin_panel/views/accounts_tree/accounts_tree_controller.dart';

import '../../../core/imports/external_imports.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  final DashboardController controller = Get.put(DashboardController());

  SearchTextField({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31,
      width: MediaQuery.sizeOf(context).width * 0.32,
      child: TextField(
        controller: searchController,
        onSubmitted: (query) {
          controller.searchAndExpandTree(query);
          controller.searchQuery.value = query;
          },
        decoration: InputDecoration(
          hintText: 'Search accounts here',
          hintStyle: getRegularStyle(color: Colors.grey, fontSize: 12),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
