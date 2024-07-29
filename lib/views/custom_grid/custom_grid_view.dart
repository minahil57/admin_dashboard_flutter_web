import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';

class CustomTableDemo extends StatefulWidget {
  final List<String> headers;
  final List<String> accountCodes;
  final List<String> accountNames;
  final List<String> costCenter4;
  final List<String> costCenter1;
  final List<String> costCenter2;
  final List<String> costCenter3;
  final List<List<String>> rows;

  const CustomTableDemo({
    super.key,
    required this.headers,
    required this.rows,
    required this.accountCodes,
    required this.accountNames,
    required this.costCenter4,
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
  });

  @override
  _CustomTableDemoState createState() => _CustomTableDemoState();
}

class _CustomTableDemoState extends State<CustomTableDemo> {
  void _addNewRow() {
    setState(() {
      widget.rows.add(['', '', '', '', '', '', '', '', '', '', '']);
    });
  }

  List<String> searchQueries = List.filled(11, '');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addNewRow,
          child: const Text('Add New Row'),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomTable(
                headers: widget.headers,
                rows: widget.rows,
                accountCodes: widget.accountCodes,
                accountNames: widget.accountNames,
                costCenter4: widget.costCenter4,
                searchQueries: searchQueries,
                costCenter1: widget.costCenter1,
                costCenter2: widget.costCenter2,
                costCenter3: widget.costCenter3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTable extends StatefulWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final List<String> accountCodes;
  final List<String> accountNames;
  final List<String> costCenter4;
  final List<String> searchQueries;
  final List<String> costCenter1;
  final List<String> costCenter2;
  final List<String> costCenter3;

  const CustomTable({
    super.key,
    required this.headers,
    required this.rows,
    required this.accountCodes,
    required this.accountNames,
    required this.costCenter4,
    required this.searchQueries,
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
  });

  @override
  _CustomTableState createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> filteredRows = widget.rows.where((row) {
      for (int i = 0; i < row.length; i++) {
        if (!row[i]
            .toLowerCase()
            .contains(widget.searchQueries[i].toLowerCase())) {
          return false;
        }
      }
      return true;
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        columnWidths: {
          for (int i = 0; i < widget.headers.length; i++)
            i: const FlexColumnWidth(),
        },
        children: [
          // Headers
          TableRow(
            decoration: const BoxDecoration(
              color: kcPrimaryColor, // Replace kcPrimaryColor with actual color
            ),
            children: widget.headers.map((header) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  header,
                  style: const TextStyle(
                      color: Colors
                          .white), // Replace getMediumStyle with actual style
                ),
              );
            }).toList(),
          ),
          // Search Fields
          TableRow(
            children: widget.headers.map((header) {
              int index = widget.headers.indexOf(header);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'contains',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 18,
                      color: Colors.grey, // Replace kcLightGrey with actual color
                    ),
                  ),
                  onChanged: (value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.searchQueries[index] = value;
                      });
                    });
                  },
                ),
              );
            }).toList(),
          ),
          // Table rows
          ...filteredRows.map((row) {
            return TableRow(
              children: row.asMap().entries.map((entry) {
                int colIndex = entry.key;
                String cell = entry.value;
                return _buildTableCell(row, colIndex, cell);
              }).toList(),
            );
          }),
          // Total Row
          TableRow(
            children: [
              for (int i = 0; i < widget.headers.length - 1; i++)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: i == 0
                      ? const Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  16), // Replace getBoldStyle with actual style
                        )
                      : const SizedBox.shrink(),
                ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _calculateTotal(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16), // Replace getBoldStyle with actual style
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(List<String> row, int colIndex, String cell) {
    if (colIndex == 0 || colIndex == 1 || colIndex >= 6 && colIndex <= 9) {
      List<String> items = colIndex == 0
          ? widget.accountCodes
          : colIndex == 1
              ? widget.accountNames
              : colIndex == 6
                  ? widget.costCenter1
                  : colIndex == 7
                      ? widget.costCenter2
                      : colIndex == 8
                          ? widget.costCenter3
                          : widget.costCenter4;
      return CustomDropdown<dynamic>.search(
        closedHeaderPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        expandedHeaderPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        enabled: true,
        decoration: const CustomDropdownDecoration(
          closedFillColor: Colors.transparent,
          listItemStyle:
              TextStyle(), // Replace getRegularStyle with actual style
          hintStyle: TextStyle(), // Replace getRegularStyle with actual style
          headerStyle: TextStyle(), // Replace getRegularStyle with actual style
        ),
        items: items,
        onChanged: (dynamic newValue) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              row[colIndex] = newValue!;
            });
          });
        },
      );
    } else if (colIndex == 10) {
      // Action column for edit icon
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Add your edit functionality here
          },
        ),
      );
    } else {
      return TextField(
        style: const TextStyle(), // Replace getRegularStyle with actual style
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          floatingLabelStyle: TextStyle(
              color: Colors.blue,
              fontSize: 12), // Replace getRegularStyle with actual style
          labelStyle: TextStyle(
            fontSize: 10,
            color: Colors.black, // Replace kcBlackColor with actual color
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        controller: TextEditingController(text: cell),
        onChanged: (newValue) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              row[colIndex] = newValue;
            });
          });
        },
      );
    }
  }

  String _calculateTotal() {
    double total = 0;
    for (var row in widget.rows) {
      total += double.tryParse(row[5]) ?? 0;
    }
    return total.toStringAsFixed(2);
  }
}

class CustomTableDemos extends StatefulWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final List<String> accountCodes;
  final List<String> accountNames;
  final List<String> costCenter4;
  final List<String> costCenter1;
  final List<String> costCenter2;
  final List<String> costCenter3;
  const CustomTableDemos({
    super.key,
    required this.headers,
    required this.rows,
    required this.accountCodes,
    required this.accountNames,
    required this.costCenter4,
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
  });
  @override
  _CustomTableDemoStates createState() => _CustomTableDemoStates();
}

class _CustomTableDemoStates extends State<CustomTableDemos> {
  // List<String> headers = [
  //   'Account Code',
  //   'Account Name',
  //   'Debit',
  //   'Tax',
  //   'VAT',
  //   'Total Narration',
  //   'Cost Center 1',
  //   'Cost Center 2',
  //   'Cost Center 3',
  //   'Cost Center 4',
  //   'Action',
  // ];
  //
  // List<List<String>> rows = [
  //   [
  //     '0123223',
  //     'Yasir Groups Limited',
  //     '0.00',
  //     '0.00',
  //     '0.00',
  //     '2500.00',
  //     '',
  //     '',
  //     '',
  //     '',
  //     ''
  //   ],
  // ];
  //
  // List<String> accountCodes = ['0123223', '0123224', '0123225'];
  // List<String> accountNames = [
  //   'Yasir Groups Limited',
  //   'Another Group',
  //   'Some Group'
  // ];
  // List<String> costCenters = [
  //   'Cost Center A',
  //   'Cost Center B',
  //   'Cost Center C'
  // ];

  List<List<TextEditingController>> controllers = [];
  List<List<FocusNode>> focusNodes = [];
  List<double> columnWidths = [];
  List<String> searchQueries = List.filled(11, '');

  @override
  void initState() {
    super.initState();
    _initializeControllersAndFocusNodes();
    columnWidths = List.filled(widget.headers.length, 100.0);
  }

  void _initializeControllersAndFocusNodes() {
    for (var row in widget.rows) {
      List<TextEditingController> rowControllers = [];
      List<FocusNode> rowFocusNodes = [];
      for (var cell in row) {
        rowControllers.add(TextEditingController(text: cell));
        rowFocusNodes.add(FocusNode());
      }
      controllers.add(rowControllers);
      focusNodes.add(rowFocusNodes);
    }
  }

  void _addNewRow() {
    setState(() {
      List<String> newRow = ['', '', '', '', '', '', '', '', '', '', ''];
      widget.rows.add(newRow);
      List<TextEditingController> newControllers = [];
      List<FocusNode> newFocusNodes = [];
      for (var cell in newRow) {
        newControllers.add(TextEditingController(text: cell));
        newFocusNodes.add(FocusNode());
      }
      controllers.add(newControllers);
      focusNodes.add(newFocusNodes);
    });
  }

  @override
  void dispose() {
    for (var rowControllers in controllers) {
      for (var controller in rowControllers) {
        controller.dispose();
      }
    }
    for (var rowFocusNodes in focusNodes) {
      for (var focusNode in rowFocusNodes) {
        focusNode.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addNewRow,
          child: const Text('Add New Row'),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              CustomTables(
                headers: widget.headers,
                rows: widget.rows,
                accountCodes: widget.accountCodes,
                accountNames: widget.accountNames,
                costCenter4: widget.costCenter4,
                searchQueries: searchQueries,
                costCenter1: widget.costCenter1,
                costCenter2: widget.costCenter2,
                costCenter3: widget.costCenter3,
                controllers: controllers,
                focusNodes: focusNodes,
                columnWidths: columnWidths,
                onColumnResize: (index, newWidth) {
                  setState(() {
                    columnWidths[index] = newWidth;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTables extends StatefulWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final List<String> accountCodes;
  final List<String> accountNames;
  final List<String> costCenter4;
  final List<String> searchQueries;
  final List<String> costCenter1;
  final List<String> costCenter2;
  final List<String> costCenter3;
  final List<List<TextEditingController>> controllers;
  final List<List<FocusNode>> focusNodes;
  final List<double> columnWidths;
  final Function(int, double) onColumnResize;

  const CustomTables({super.key, 
    required this.headers,
    required this.rows,
    required this.accountCodes,
    required this.accountNames,
    required this.costCenter4,
    required this.searchQueries,
    required this.costCenter1,
    required this.costCenter2,
    required this.costCenter3,
    required this.controllers,
    required this.focusNodes,
    required this.columnWidths,
    required this.onColumnResize,
  });

  @override
  _CustomTableStates createState() => _CustomTableStates();
}

class _CustomTableStates extends State<CustomTables> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> filteredRows = widget.rows.where((row) {
      for (int i = 0; i < row.length; i++) {
        if (!row[i]
            .toLowerCase()
            .contains(widget.searchQueries[i].toLowerCase())) {
          return false;
        }
      }
      return true;
    }).toList();

    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: {
        for (int i = 0; i < widget.headers.length; i++)
          i: const FlexColumnWidth(),
      },
      children: [
        // Headers
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.blue, // Replace with actual color
          ),
          children: widget.headers.asMap().entries.map((entry) {
            int index = entry.key;
            String header = entry.value;
            return ResizableColumn(
              width: widget.columnWidths[index],
              header: header,
              onResize: (newWidth) => widget.onColumnResize(index, newWidth),
            );
          }).toList(),
        ),
        // Search Fields
        TableRow(
          children: widget.headers.map((header) {
            int index = widget.headers.indexOf(header);
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              constraints: BoxConstraints(
                minWidth: MediaQuery.sizeOf(context).width,
                maxWidth: MediaQuery.sizeOf(context).width,
                minHeight: 40,
                maxHeight: 45,
              ),
              child: TextField(
                style: getRegularStyle(),
                decoration: InputDecoration(
                  hintText: 'contains',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.filter_alt_outlined,
                    size: 18,
                    color: Colors.grey, // Replace kcLightGrey with actual color
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    widget.searchQueries[index] = value;
                  });
                },
              ),
            );
          }).toList(),
        ),
        // Table rows
        ...filteredRows.asMap().entries.map((entry) {
          int rowIndex = entry.key;
          List<String> row = entry.value;
          return TableRow(
            children: row.asMap().entries.map((entry) {
              int colIndex = entry.key;
              log(colIndex.toString());
              String cell = entry.value;
              // Ensure the indices are valid
              if (colIndex >= widget.controllers[rowIndex].length) {
                log(colIndex.toString());
                return Container();
              }
              log(colIndex.toString());
              return _buildTableCells(row, rowIndex, colIndex+1, cell);
            }).toList(),
          );
        }),
        // Total Row
        TableRow(
          children: [
            for (int i = 0; i < widget.headers.length - 1; i++)
              Container(
                padding: const EdgeInsets.all(8.0),
                child: i == 0
                    ? const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : const SizedBox.shrink(),
              ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _calculateTotals(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCells(
      List<String> row, int rowIndex, int colIndex, String cell) {
    if (colIndex == 0 || colIndex == 1 || (colIndex >= 6 && colIndex <= 9)) {
      List<String> items = colIndex == 0
          ? widget.accountCodes
          : colIndex == 1
          ? widget.accountNames
          : colIndex == 6
          ? widget.costCenter1
          : colIndex == 7
          ? widget.costCenter2
          : colIndex == 8
          ? widget.costCenter3
          : widget.costCenter4;
      return CustomDropdown<dynamic>.search(
        closedHeaderPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        expandedHeaderPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        enabled: true,
        decoration: CustomDropdownDecoration(
          closedFillColor: Colors.transparent,
          listItemStyle:
              getRegularStyle(), // Replace getRegularStyle with actual style
          hintStyle:
              getRegularStyle(), // Replace getRegularStyle with actual style
          headerStyle:
              getRegularStyle(), // Replace getRegularStyle with actual style
        ),
        items: items,
        onChanged: (dynamic newValue) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              row[colIndex] = newValue!;
            });
          });
        },
      );
    } else if (colIndex == 10) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Action for edit icon
          },
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.controllers[rowIndex][colIndex],
          focusNode: widget.focusNodes[rowIndex][colIndex],
          style: getRegularStyle(),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            floatingLabelStyle:
                getRegularStyle(), // Replace getRegularStyle with actual style
            labelStyle: getRegularStyle(),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              widget.controllers[rowIndex][colIndex].text = value;
              widget.controllers[rowIndex][colIndex].selection =
                  TextSelection.fromPosition(
                TextPosition(offset: value.length),
              );
              row[colIndex] = value;
            });
          },
        ),
      );
    }
  }

  String _calculateTotals() {
    double total = 0.0;
    for (var row in widget.rows) {
      total += double.tryParse(row[5]) ?? 0.0;
    }
    return total.toStringAsFixed(2);
  }
}
class ResizableColumn extends StatefulWidget {
  final double width;
  final String header;
  final Function(double) onResize;

  const ResizableColumn({
    super.key,
    required this.width,
    required this.header,
    required this.onResize,
  });

  @override
  _ResizableColumnState createState() => _ResizableColumnState();
}

class _ResizableColumnState extends State<ResizableColumn> {
  late double _currentWidth;

  @override
  void initState() {
    super.initState();
    _currentWidth = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _currentWidth += details.delta.dx;
          widget.onResize(_currentWidth);
        });
      },
      child: Container(
        width: _currentWidth,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.header,
                style: const TextStyle(color: Colors.white), // Replace with actual style
              ),
            ),
            const Icon(
              Icons.drag_handle,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}