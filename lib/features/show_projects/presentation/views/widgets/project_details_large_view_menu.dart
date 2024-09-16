import 'package:flutter/material.dart';

class ProjectDetailsLargeViewMenu extends StatelessWidget {
  final Function(int) onTap;

  const ProjectDetailsLargeViewMenu({
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
        child: ListView(
          children: [
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              title: const Text('دورة المشروع'),
              leading: const Icon(Icons.electric_bolt_rounded),
            ),
            const Divider(),
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              title: const Center(
                child: Text(
                  'BOQ',
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                indexScreen = 0;
                onTap(indexScreen);
              },
            ),
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              title: const Center(
                child: Text(
                  'استلام الموقع',
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                indexScreen = 1;
                onTap(indexScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
