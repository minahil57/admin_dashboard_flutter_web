import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/services.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/common_widgets/searchable_dropdown_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/imports/external_imports.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchableDropdownRenderer extends StatefulWidget {
  final BuildContext context;
  final List<String> items;
  final String text;
  final ValueChanged<String?> onChanged;

  const SearchableDropdownRenderer({
    super.key,
    required this.context,
    required this.items,
    required this.text,
    required this.onChanged,
  });

  @override
  _SearchableDropdownRendererState createState() =>
      _SearchableDropdownRendererState();
}

class _SearchableDropdownRendererState extends State<SearchableDropdownRenderer> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  final DropdownController _dropdownController = Get.put(DropdownController());
  OverlayEntry? _overlayEntry;
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _controller.text = widget.text;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onTextChanged() {
    final query = _controller.text;
    if (query.isNotEmpty) {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _showOverlay();
    } else {
      _filteredItems.clear();
      _removeOverlay();
    }
  }

  void _showOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
      return;
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        height: _filteredItems.isEmpty? 0.0: size.height * 5.0,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _dropdownController.filteredItems.length,
              itemBuilder: (BuildContext context , int index) {
                return Obx(()=>
                   ListTile(

                    title: Text(_dropdownController.filteredItems[index]),
                    tileColor: _dropdownController.highlightedIndex.value == index ? kcPrimaryColor.withOpacity(0.3) : null ,
                    onTap: () {
                      _controller.text = _dropdownController.filteredItems[index];
                      widget.onChanged(_dropdownController.filteredItems[index]);
                      _removeOverlay();
                    },
                  ),
                );
              }),
            ),
          ),
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) => _dropdownController.handleKeyEvent(node, event)!,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: TextField(
          controller: _controller,
          onSubmitted: widget.onChanged,
          onChanged: (value) {
            log(value);
            _dropdownController.filterItems(value, widget.items);
          },

          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}



class CustomDropDownCellRenderer {
  static Widget renderer(
    PlutoColumnRendererContext rendererContext,
    List<String> items,
  ) {
    return CustomDropdown<dynamic>.search(
      closedHeaderPadding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      expandedHeaderPadding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      enabled: true,
      decoration: CustomDropdownDecoration(
        closedFillColor: Colors.transparent,
        listItemStyle: getRegularStyle(),
        hintStyle: getRegularStyle(),
        headerStyle: getRegularStyle(),
      ),
      // validator: (dynamic? item) {
      //   if (item == null)
      //     return "Required field";
      //   else
      //     return null;
      // },
      items: items,
      onChanged: (dynamic newValue) {
        log('testing');
        rendererContext.stateManager.changeCellValue(
          rendererContext.cell,
          newValue,
          notify: true,
        );
      },
    );

    //   DropdownButton<String>(
    //   value: rendererContext.cell.value,
    //   items: items.map((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value ,
    //       child: Text(value),
    //     );
    //   }).toList(),
    //   onChanged: (String? newValue) {
    //     rendererContext.stateManager.changeCellValue(
    //       rendererContext.cell,
    //       newValue,
    //       notify: true,
    //     );
    //   },
    // );
  }
}
