import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/users_list/repo/user_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserServices().getUser();
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
