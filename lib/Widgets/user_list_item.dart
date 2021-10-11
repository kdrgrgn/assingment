import 'package:assingment/Constant/constant.dart';
import 'package:assingment/Constant/functions.dart';
import 'package:assingment/Controller/account_controller.dart';
import 'package:assingment/Model/User/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListItem extends StatelessWidget {


  late User user;
  late Function onTap;


  UserListItem(
      {Key? key,
        required this.user,
        required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerAccount>(
      builder: (controller) {
        return InkWell(
          onTap:()=> onTap(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[100]!),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(user.profilePhoto!,height: 32,width: 32,),
                    ),
                  ),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.fullName!),
                      Text(user.email!),

                      Text(CustomFunctions().dateToString(DateTime.parse(user.birthDate!))),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
if(controller.user!.value.friendIds!.contains(user.id)){
 await controller.removeFromFriends(user.id!).then((value) {
   Get.showSnackbar(GetBar(message: value!.message.toString(),duration: const Duration(seconds: 3),));
 });
}else{
  await controller.addToFriends(user.id!).then((value) {
    Get.showSnackbar(GetBar(message: value!.message.toString(),duration: const Duration(seconds: 3),));

  });

}
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              controller.user!.value.friendIds!.contains(user.id)?Icons.person_remove_alt_1: Icons.person_add_alt_1,
                              color: mainColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }


}
