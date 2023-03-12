import 'package:client/styles/typography.dart';
import 'package:flutter/material.dart';

class Thread extends StatelessWidget {
  const Thread({
    super.key,
    required this.depth,
    required this.title,
    required this.body,
  });

  final int depth;
  final String title;
  final String body;

  Widget buildThreads(int depth) {
    Widget padder = Container(
      width: 1.5,
      color: Colors.grey,
    );
    List<Widget> row_children = [];
    for (int i = 0; i < depth; i++) {
      row_children.add(Padding(
        padding: const EdgeInsets.only(right: 15),
        child: padder,
      ));
    }
    return Row(
      children: row_children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildThreads(depth),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: kTitle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12.5),
                Text(
                  body,
                  textAlign: TextAlign.left,
                  style: kBody.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
