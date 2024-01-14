import 'package:alshrouk_academy/data/models/users_model.dart';

abstract class UsersState{}


class UsersInitial extends UsersState{}
class UsersLoading extends UsersState{}
class UsersDone extends UsersState{

  List<UsersModel>? usersModel;

  UsersDone(this.usersModel);
}
class UsersError extends UsersState{}