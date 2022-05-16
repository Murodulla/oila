import 'package:flutter/material.dart';
import 'widgets/custom.widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomWidget(),
      ),
    );
  }
}
