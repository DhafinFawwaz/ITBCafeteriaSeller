import 'package:flutter/material.dart';
import '../../model/register_model.dart';
import '../../services/api_service.dart';
import 'package:itb_cafeteria_seller/const.dart';
import 'package:itb_cafeteria_seller/widgets/rounded_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? telephone;
  String? password;
  String? confirmPassword;
  String? currentPassword = "";

  void onSubmit() {
    if (validateAndSave()) {
      setState(() {
        isAPIcallProcess = true;
      });

      RegisterRequest model = RegisterRequest(
          username: username!,
          email: email!,
          telephone: "",
          password: password!,
          locationId: 1
        );

      APIService.register(model).then((response) => {
            setState(() {
              isAPIcallProcess = false;
            }),
            if (response.message != "success")
              {onRegisterSuccess(response)}
            else
              {onRegisterFailed(response)}
          });
    }
  }

  void onRegisterFailed(RegisterResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onRegisterSuccess(RegisterResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20,),
            Image.asset(
              'assets/images/icon/icon.png',
              height: 100,
            ),
            const SizedBox(height: 20,),
            UnconstrainedBox(
              child: SizedBox(
                height: 428,
                width: 302,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: blackColor,
                          width: 1.0,
                          style: BorderStyle.solid),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      // Username
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        width: 222,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: blackColor))),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              labelText: "Username",
                              hintText: 'Your name',
                              labelStyle: TextStyle(
                                  color: halfTransparant,
                                  fontFamily: 'inter',
                                  fontSize: 16)),
                          obscureText: false,
                          onSaved: (value) => username = value,
                        ),
                      ),
                      // Email
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 222,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: blackColor))),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: "Email Address",
                              hintText: 'you@gmail.com',
                              labelStyle: TextStyle(
                                  color: halfTransparant,
                                  fontFamily: 'inter',
                                  fontSize: 16)),
                          obscureText: false,
                          onSaved: (value) => email = value,
                        ),
                      ),

                      //Password
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 222,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: blackColor))),
                        child: TextFormField(
                          validator: (value) {
                            password = value;
                            if (value != null && value.isEmpty) {
                              return "Password is Empty";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: 'Enter your Password',
                              labelStyle: TextStyle(
                                  color: halfTransparant,
                                  fontFamily: 'inter',
                                  fontSize: 16)),
                          obscureText: false,
                          onSaved: (value) => password = value,
                        ),
                      ),

                      //Comfirm Password
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 222,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: blackColor))),
                        child: TextFormField(
                        validator: (value) {
                          confirmPassword = value;
                          if (value != null && value.isEmpty) {
                            return "Password is Empty";
                          } else {
                            if (value != password) {
                              return "Password doesn't match";
                            }
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: "Confirm Password",
                            hintText: 'Confirm your Password',
                            labelStyle: TextStyle(
                                color: halfTransparant,
                                fontFamily: 'inter',
                                fontSize: 16)),
                        obscureText: false,
                        onSaved: (value) => confirmPassword = value,
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 34,
                          width: 178,
                          decoration: const BoxDecoration(
                              color: greyColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: RoundedButton(
                            textSize: 16,
                            width: 68,
                            height: 39,
                            text: "Register",
                            color: acceptGreen,
                            onPressed: onSubmit,
                            borderRadius: BorderRadius.circular(19),
                            textColor: halfTransparantWhite,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Signed up?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            child: const Text(
                              "Login here",
                              style: TextStyle(
                                  color: linkColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
