import 'package:assingment/Model/Token/token_main.dart';
import 'package:assingment/Model/User/user.dart';
import 'package:assingment/Model/User/user_main.dart';
import 'package:assingment/Service/service_base.dart';
import 'package:assingment/Service/service_db.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


 class ControllerAccount extends GetxController implements ServiceBase {


  Rx<User>? user;
  RxList<User> userList=<User>[].obs;

RxBool isLoadingLanding=true.obs;

  Rx<PageState> pageState = PageState.normal.obs;



  final ServiceDB serviceDB = ServiceDB();



  @override
  Future<UserMain?> addToFriends(String userId) async {
   UserMain? tempMain=  await serviceDB.addToFriends(userId);
   if(tempMain==null){
     changePageState(false);
   } else {
     defineUser(tempMain.data!);
     return tempMain;

   }

  }

  @override
  Future<User?> getAccount() async {
    pageLoading();

    User? tempUser = await serviceDB.getAccount();
    if (tempUser == null) {
      changePageState(false);
    } else {
      defineUser(tempUser);
    }
    return tempUser;
  }

  @override
  Future<List<User>?> getUsers() async {
    pageLoading();
    List<User>? tempUsers = await serviceDB.getUsers();
    changePageState(tempUsers == null ? false : true);

    userList.addAll(tempUsers!);
    update();
    return tempUsers;
  }

  @override
  Future<UserMain?> removeFromFriends(String userId) async {

    UserMain? tempMain=  await serviceDB.removeFromFriends(userId);
    if(tempMain==null){
      changePageState(false);
    } else {
      defineUser(tempMain.data!);
      return tempMain;

    }
  }

  @override
  Future<TokenMain?> signIn(String email, String password) async {
    pageLoading();

    TokenMain? tokenMain = await serviceDB.signIn(email, password);
print("tokenMain = $tokenMain");
    if (tokenMain != null) {

      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: tokenMain.data!.token);
      await getAccount();
    }else{
      pageState = PageState.normal.obs;
      update();


    }

    return tokenMain;
  }

  void defineUser(User tempUser) {
    user = tempUser.obs;
    pageState = PageState.success.obs;
    update();
  }

  void pageLoading() {
    pageState = PageState.loading.obs;
    update();

  }

  Future<void> changePageState(bool isSuccess) async {
    if (isSuccess) {
      pageState = PageState.success.obs;
    } else {
      const storage = FlutterSecureStorage();
      await storage.delete(key: 'token');
      user=null;
      pageState = PageState.error.obs;
    }
    update();

  }

  Future<void> currentUser() async {
    var storage = const FlutterSecureStorage();

    isLoadingLanding=true.obs;
    update();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      await getAccount();
      isLoadingLanding=false.obs;
      update();

    } else {
      pageState = PageState.normal.obs;
      isLoadingLanding=false.obs;
      update();

    }

  }
}

enum PageState { loading, error, success, normal }
