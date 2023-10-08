import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/components/app_loading.dart';
import 'package:flutter_mvvm_provider/components/user_list_row.dart';
import 'package:flutter_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm_provider/users_list/view_models/users_view_model.dart';
import 'package:flutter_mvvm_provider/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(usersViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.usersListModel[index];
          return UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetials(context);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModel.usersListModel.length,
      ),
    );
  }
}
