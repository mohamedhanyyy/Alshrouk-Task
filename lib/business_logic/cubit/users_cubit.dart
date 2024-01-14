import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alshrouk_academy/business_logic/cubit/users_cubit_state.dart';
import 'package:alshrouk_academy/data/models/users_model.dart';

import '../../data/remote/repo/users_repo.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  UsersRepoImpl usersRepoImpl = UsersRepoImpl();

  Future<void> getUsersData() async {
    emit(UsersLoading());
    Response? response = await usersRepoImpl.getUsers();
    if (response?.statusCode == 200) {
      List<UsersModel> itemList = [];
      response?.data.map((json) {
        itemList.add(UsersModel.fromJson(json));
      }).toList();
      if (kDebugMode) {
        print(itemList);
      }
      emit(UsersDone(itemList));
    } else {
      emit(UsersError());
    }
  }
}
