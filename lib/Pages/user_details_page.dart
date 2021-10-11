import 'package:assingment/Constant/constant.dart';
import 'package:assingment/Constant/functions.dart';
import 'package:assingment/Controller/account_controller.dart';
import 'package:assingment/Model/User/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsPage extends StatelessWidget {
  User user;

  UserDetailsPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerAccount>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Kullanıcı Detay Sayfası"),
        ),
        body: Column(
          children: [
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          user.profilePhoto!,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Ad Soyad: " + user.fullName!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 2.5,
                            color: mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Mail: " + user.email!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 2.5,
                            color: mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Doğum Günü: " +
                              CustomFunctions().dateToString(
                                  DateTime.parse(user.birthDate!))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: InkWell(
                onTap: () async {
                  if (controller.user!.value.friendIds!.contains(user.id)) {
                    await controller.removeFromFriends(user.id!).then((value) {
                      Get.showSnackbar(GetBar(
                        message: value!.message.toString(),
                        duration: const Duration(seconds: 3),
                      ));
                    });
                  } else {
                    await controller.addToFriends(user.id!).then((value) {
                      Get.showSnackbar(GetBar(
                        message: value!.message.toString(),
                        duration: const Duration(seconds: 3),
                      ));
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      controller.user!.value.friendIds!.contains(user.id)
                          ? "Arkadaşlıktan Çıkar"
                          : "Arkadaş olarak ekle",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
