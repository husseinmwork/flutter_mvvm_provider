import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/components/app_title.dart';
import 'package:flutter_mvvm_provider/users_list/models/users_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel? userModel;
  final VoidCallback? onTap;
  const UserListRow({this.onTap, this.userModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(text: userModel!.name.toString()),
          Text(
            userModel!.email.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
