import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

class AccountTreeView extends StatefulWidget {
  const AccountTreeView({super.key});

  @override
  _AccountTreeViewState createState() => _AccountTreeViewState();
}

class _AccountTreeViewState extends State<AccountTreeView> {
  late TreeViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TreeViewController(
      children: [
        const Node(
          label: 'Accounts Name : ASSET',
          key: '0',
          children: [
            Node(
              label: 'KCB Account',
              key: '1',
              children: [],
            ),
            Node(
              label: 'Dubai Bank',
              key: '2',
              children: [],
            ),
            Node(
              label: 'Yasir Bank',
              key: '3',
              children: [
                Node(
                  label: 'Test Bank',
                  key: '4',
                  children: [],
                ),
                Node(
                  label: 'Wal Bank',
                  key: '5',
                  children: [
                    Node(
                      label: 'Test Bank',
                      key: '6',
                      children: [],
                    ),
                    Node(
                      label: 'Wal Bank',
                      key: '7',
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
            Node(
              label: 'Qfinity Account',
              key: '8',
              children: [],
            ),
            Node(
              label: 'Qfinity Account',
              key: '9',
              children: [],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts Listing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TreeView(
          controller: _controller,
          allowParentSelect: true,
          supportParentDoubleTap: false,
          onNodeTap: (key) {
            setState(() {
              _controller = _controller.copyWith(selectedKey: key);
            });
          },
          nodeBuilder: (context, node) {
            return DottedLineNode(node: node);
          },
        ),
      ),
    );
  }
}

class DottedLineNode extends StatelessWidget {
  final Node node;

  const DottedLineNode({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Text(node.label),
          ),
          // Add balance, account code, etc., here as needed
        ],
      ),
    );
  }
}