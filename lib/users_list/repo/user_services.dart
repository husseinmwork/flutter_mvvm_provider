import 'dart:io';

import 'package:flutter_mvvm_provider/utils/constant.dart';
import 'package:flutter_mvvm_provider/users_list/models/users_list_model.dart';
import 'package:flutter_mvvm_provider/users_list/repo/api_status.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUser() async {
    try {
      var url = Uri.parse(usersList);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(respons: usersListModelFromJson(response.body));
      }
      return Failure(
          code: userInvalidResponse, errorRespons: 'Invalid Respons');
    } on HttpException {
      return Failure(code: noInternet, errorRespons: 'No Internet');
    } catch (e) {
      return Failure(code: unknownError, errorRespons: 'Unknown Error');
    }
  }
}
