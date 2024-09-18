import '/features/show_projects/presentation/views/widgets/other_additions/other_additions_view_body.dart';
import 'package:flutter/material.dart';

class OtherAdditionsView extends StatelessWidget {
  const OtherAdditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافات اخرى'),
        centerTitle: true,
      ),
      body: const OtherAdditionsViewBody(),
    );
  }
}
