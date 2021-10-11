import 'package:assingment/Controller/account_controller.dart';
import 'package:assingment/Pages/login_page.dart';
import 'package:assingment/Pages/user_list_page.dart';
import 'package:assingment/Widgets/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
 final ControllerAccount _controllerAccount= Get.put(ControllerAccount());


 @override
  void initState() {
    // TODO: implement initState
   super.initState();

   WidgetsBinding.instance!.addPostFrameCallback((timeStamp)async {

  await  _controllerAccount.currentUser();

    });

 }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerAccount>(
      init: _controllerAccount,

       builder: (ControllerAccount _c) {
      return _c.pageState.value == PageState.error
          ?  Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children:  [
                    const Text("İşlem sırasında bir hata oluştu"),
                    InkWell(onTap: (){
                      _c.pageState=PageState.normal.obs;
                      _c.update();
                    },child: const Text("Tekrar giriş yapmak için lütfen tıklayınız",style: TextStyle(color: Colors.blue),)),
                  ],
                ),
              ),
            )
          :_c.isLoadingLanding.value?const Scaffold(body: CustomCircular()): _c.user == null
                  ? const LoginPage()
                  : const UserListPage();
    });
  }
}
