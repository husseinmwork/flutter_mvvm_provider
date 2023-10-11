import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/users_list/views/add_user_screen.dart';
import 'package:flutter_mvvm_provider/users_list/views/user_details_screen.dart';

void openUserDetials(BuildContext context) async => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UserDetailsScreen()),
    );
void openAddUser(BuildContext context) async => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddUserScreen()),
    );
