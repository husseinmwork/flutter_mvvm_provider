import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/users_list/models/user_error.dart';
import 'package:flutter_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm_provider/users_list/repo/api_status.dart';
import 'package:flutter_mvvm_provider/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _usersListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get usersListModel => _usersListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UsersViewModel() {
    getUsers();
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _usersListModel = userListModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _usersListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.email!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUser();
    if (response is Success) {
      setUserListModel(response.respons as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorRespons.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
