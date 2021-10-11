import 'package:assingment/Model/Token/token_main.dart';
import 'package:assingment/Model/User/user.dart';
import 'package:assingment/Model/User/user_main.dart';

abstract class ServiceBase{
  Future<User?> getAccount();

  Future<TokenMain?> signIn(String email,String password);
  Future<List<User>?> getUsers();

  Future<UserMain?> addToFriends(String userId);

  Future<UserMain?> removeFromFriends(String userId);


}