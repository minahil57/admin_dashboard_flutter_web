/// Dart import
import 'dart:core';

/// Package import
import 'package:flutter/material.dart';
import 'package:getx_admin_panel/views/data_source.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


/// Render data grid with editing.
class EditingDataGrid extends StatefulWidget {
  /// Create data grid with editing.
  const EditingDataGrid({Key? key}) : super(key: key);

  @override
  State<EditingDataGrid> createState() => _EditingDataGridState();

}

class _EditingDataGridState extends State<EditingDataGrid> {
  @override
  void initState() {
    super.initState();
    editingDataGridSource = DealerDataGridSource();
    panelOpen = frontPanelVisible.value;
    frontPanelVisible.addListener(_subscribeToValueNotifier);
  }

  final ValueNotifier<bool> frontPanelVisible = ValueNotifier<bool>(true);
  void _subscribeToValueNotifier() => panelOpen = frontPanelVisible.value;
  bool panelOpen = false;

  /// DataGridSource of [SfDataGrid]
  late DealerDataGridSource editingDataGridSource;

  /// Determine to decide whether the device in landscape or in portrait.
  late bool isLandscapeInMobileView;

  /// Help to identify the desktop or mobile.
  // late bool isWebOrDesktop;

  /// Determine the editing action on [SfDataGrid]
  EditingGestureType editingGestureType = EditingGestureType.doubleTap;

  SfDataGrid _buildDataGrid(BuildContext context) {
    return SfDataGrid(
      source: editingDataGridSource,
      allowEditing: true,
      navigationMode: GridNavigationMode.cell,
      selectionMode: SelectionMode.single,
      editingGestureType: editingGestureType,
      // columnWidthMode: isWebOrDesktop
      //     ? (isWebOrDesktop && model.isMobileResolution)
      //     ? ColumnWidthMode.none
      //     : ColumnWidthMode.fill
      //     : isLandscapeInMobileView
      //     ? ColumnWidthMode.fill
      //     : ColumnWidthMode.none,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'Product No',
            width:  110,
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: const Text(
                'Product No',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
            columnName: 'Dealer Name',
            // width: isWebOrDesktop ? double.nan : 110,
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Dealer Name',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
            columnName: 'Shipped Date',
            // width: isWebOrDesktop ? double.nan : 110,
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: const Text(
                'Shipped Date',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
            columnName: 'Ship Country',
            // width: isWebOrDesktop ? double.nan : 110,
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Ship Country',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
            columnName: 'Ship City',
            // width: isWebOrDesktop ? double.nan : 110,
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Ship City',
                overflow: TextOverflow.ellipsis,
              ),
            )),
        GridColumn(
            columnName: 'Price',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: const Text(
                'Price',
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // editingDataGridSource.sampleModel = model;
    // isLandscapeInMobileView = !isWebOrDesktop &&
    //     MediaQuery.of(context).orientation == Orientation.landscape;
  }

  @override
  Widget build(BuildContext context) {
    return _buildDataGrid(context);
  }
}