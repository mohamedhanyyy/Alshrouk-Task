import 'package:dio/dio.dart';
import 'package:alshrouk_academy/services/remote/api_helper/dio_helper.dart';
import 'package:alshrouk_academy/shared/const/api_consts.dart';

abstract class UsersRepo {
  Future<Response?> getUsers();


}

class UsersRepoImpl implements UsersRepo {
  @override

  Future<Response?> getUsers() async {
    Response? response = await DioHelper.getData(url: EndPoints.users);
    return response;
  }
}
