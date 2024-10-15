import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatefulWidget {
  final bool value;
  final String title;
  final Function(bool value) onChanged;
  const CustomSwitchListTile({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  late bool _currntValue;

  @override
  void initState() {
    _currntValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.all(0),
      value: _currntValue,
      title: Text(widget.title),
      onChanged: (v) {
        setState(() {
          _currntValue = !_currntValue;
          widget.onChanged(v);
        });
      },
    );
  }
}
