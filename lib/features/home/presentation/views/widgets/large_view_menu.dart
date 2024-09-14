import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'custom_show_more_menu.dart';

class LargeViewMenu extends StatelessWidget {
  final Function(int) onTap;

  const LargeViewMenu({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int indexScreen = 0;
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 215,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Text('Welcome'),
                    leading: const Icon(Icons.electric_bolt_rounded),
                  ),
                  const Divider(),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 0;
                      onTap(indexScreen);
                    },
                    title: const Text('statistics'),
                    leading: const Icon(IconlyBroken.chart),
                  ),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 1;
                      onTap(indexScreen);
                    },
                    title: const Text('New project'),
                    leading: const Icon(IconlyBroken.arrowUpSquare),
                  ),
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onTap: () {
                      indexScreen = 2;
                      onTap(indexScreen);
                    },
                    title: const Text('All project'),
                    leading: const Icon(IconlyBroken.document),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 14),
              child: CustomShowMoreMenu(
                child: ListTile(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: const Text('More'),
                  leading: const Icon(IconlyBroken.moreSquare),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
