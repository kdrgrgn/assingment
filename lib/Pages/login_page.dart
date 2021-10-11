import 'package:assingment/Constant/constant.dart';
import 'package:assingment/Controller/account_controller.dart';
import 'package:assingment/Model/Token/token_main.dart';
import 'package:assingment/Widgets/custom_circular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {



  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? mail;

  String? password;

  bool isVisible=false;

  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body:GetBuilder<ControllerAccount>(builder:(controller){
          return  controller.pageState.value==PageState.loading?const CustomCircular():loginBody(height);
        },)

    );
  }



  bool isNumeric(String? s) {
    if(s == null) {
      return false;
    }

    try{
      int.parse(s);
      return true;
    }catch(e){
      return false;
    }


  }

  Widget _entryField({required String title, bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(

        keyboardType: isPassword
            ? TextInputType.number
            : TextInputType.emailAddress,


        style: const TextStyle(color: Colors.black, fontSize: 17),
        validator: (value) {

          if (value!.isEmpty) {
            return "Doldurunuz";
          } else {
            if(!isPassword && (!value.contains("@")|| !value.contains("."))){
              return "Email formatına uygun değil";
            }else if(isPassword && !isNumeric(value)){
              return value.length>19?"Çok fazla rakam  girildi":"Şifreye sadece sayı girilmeli";

            }else{
              return null;

            }

          }
        },
        onSaved: (value) {
          if (isPassword) {
            password = value!;
          } else {
            mail = value!;
          }
        },

        decoration: InputDecoration(
          suffixIcon: isPassword?InkWell(onTap:(){
            setState(() {
              isVisible=!isVisible;
            });
          },child:  isVisible?const Icon(Icons.visibility_off_sharp):const Icon(Icons.visibility)
          ):null,
          labelText: title,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: BorderSide(color: mainColor)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        ),
        obscureText: isPassword?!isVisible:false,
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        await signIn();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 70, right: 70),
        decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(35)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Hesabıma Giriş Yap",
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ControllerAccount _controllerAccount =   Get.put(ControllerAccount());
     await _controllerAccount.signIn(mail!, password!).then((tokenMain) {
        if(tokenMain==null){
          _showDialog("Giriş Başarısız","Giriş bilgilerinizi kontrol ediniz",context);

        }
      });



    }
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(child: _entryField(title: "E-mail")),
          const SizedBox(
            height: 10,
          ),
          Container(child: _entryField(title: "Şifre", isPassword: true)),
        ],
      ),
    );
  }



  SingleChildScrollView loginBody(double height) {
    return SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>  [
               const SizedBox(
                  height: 130,
                ),
                Image.asset(
                  "assets/logo.png",
                  height: 120,

                ),
                const  SizedBox(
                  height: 50,
                ),
                _emailPasswordWidget(),

                const  SizedBox(
                  height: 20,
                ),
                _submitButton(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
  }

  Future<void> _showDialog(String title, String content,BuildContext context) {


    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            content: Text(content),
          );
        }).then((value) => {


    });

  }
}
