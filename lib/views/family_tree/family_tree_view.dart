import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class FamilyTreeView extends StatelessWidget {
  const FamilyTreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3);
    graph.addEdge(node2, node4);

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Oila daraxti'),
      ),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.01,
        maxScale: 5.6,
        child: GraphView(
          graph: graph,
          algorithm:
              BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
          paint: Paint()
            ..color = Colors.green
            ..strokeWidth = 2
            ..style = PaintingStyle.stroke,
          builder: (Node node) {
            // I can decide what widget should be shown here based on the id
            // int a = node.key?.value as int;
            return _RectangeViewWidget(nodeId: 1);
          },
        ),
      ),
    );
  }
}

final Graph graph = Graph()..isTree = true;
BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

class _RectangeViewWidget extends StatelessWidget {
  const _RectangeViewWidget({
    required this.nodeId,
    Key? key,
  }) : super(key: key);

  final int nodeId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: Colors.blue, spreadRadius: 1),
          ],
        ),
        child: Text('User Name field $nodeId'),
      ),
    );
  }
}

@override
void initState() {}
