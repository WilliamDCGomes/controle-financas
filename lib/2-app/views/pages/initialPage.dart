import 'package:financas_controle/2-app/controllers/initialPageController.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => InitialPageController().loadFirstScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

