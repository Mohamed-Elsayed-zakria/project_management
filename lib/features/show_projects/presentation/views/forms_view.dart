import 'widgets/forms/forms_view_body.dart';
import 'package:flutter/material.dart';

class FormsView extends StatelessWidget {
  const FormsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("النماذج"),
        centerTitle: true,
      ),
      body: const FormsViewBody(),
    );
  }
}
