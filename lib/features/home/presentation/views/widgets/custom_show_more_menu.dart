import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class CustomShowMoreMenu extends StatefulWidget {
  final Widget? child;
  const CustomShowMoreMenu({
    super.key,
    this.child,
  });

  @override
  State<CustomShowMoreMenu> createState() => _CustomShowMoreMenuState();
}

class _CustomShowMoreMenuState extends State<CustomShowMoreMenu> {
  SampleItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Colors.white,
      initialValue: selectedItem,
      icon: widget.child == null
          ? const Icon(
              IconlyBroken.moreSquare,
              size: 30,
            )
          : null,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: SizedBox(
            width: 300,
            child: ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              title: const Text('Setting'),
              leading: const Icon(IconlyBroken.setting),
            ),
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: ListTile(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            title: const Text('Profile'),
            leading: const Icon(IconlyBroken.profile),
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: ListTile(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            title: const Text('Sign out'),
            leading: const Icon(IconlyBroken.logout),
          ),
        ),
      ],
      child: widget.child,
    );
  }
}

enum SampleItem { itemOne, itemTwo, itemThree }
