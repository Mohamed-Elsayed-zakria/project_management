import '/features/new_project/presentation/views/new_project_view.dart';
import 'package:flutter/material.dart';
import 'large_view_menu.dart';

class LargeViewBody extends StatefulWidget {
  const LargeViewBody({super.key});

  @override
  State<LargeViewBody> createState() => _LargeViewBodyState();
}

class _LargeViewBodyState extends State<LargeViewBody> {
  int indexScreen = 0;
  final List<Widget> screens = [
    const Card(
      color: Colors.white,
      elevation: 3,
      child: Text('statistics'),
    ),
    const NewProjectView(),
    const Card(
      color: Colors.white,
      elevation: 3,
      child: Text('All projects'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LargeViewMenu(
          onTap: (value) => {
            indexScreen = value,
            setState(() {}),
          },
        ),
        Expanded(
          child: Center(
            child: screens[indexScreen],
          ),
        ),
      ],
    );
  }
}
