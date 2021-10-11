import 'package:assingment/Controller/account_controller.dart';
import 'package:assingment/Pages/user_details_page.dart';
import 'package:assingment/Widgets/custom_circular.dart';
import 'package:assingment/Widgets/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final ControllerAccount _controllerAccount = Get.put(ControllerAccount());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerAccount.getUsers();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
              appBar: AppBar(
                title: const Text("Kullanıcı Listesi"),
              ),
              body:  GetBuilder<ControllerAccount>( builder: (snapshot) {
                  return snapshot.pageState.value == PageState.loading?const CustomCircular(): ListView.builder(
                      itemCount: snapshot.userList.length,
                      itemBuilder: (context, index) {
                        return UserListItem(
                            user: snapshot.userList[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      UserDetailsPage(snapshot.userList[index])));
                            });
                      });
                }
              ),
            );

  }
}
