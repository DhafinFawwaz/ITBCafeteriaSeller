import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/widgets/rounded_button.dart';
import '../../model/login_model.dart';
import '../../services/api_service.dart';
import 'package:itb_cafeteria_seller/const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false; // can be used to show loading indicator
  bool hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? username;
  String? currentPassword;

  void onSubmit() async {
    if (validateAndSave()) {
      setState(() {
        isAPIcallProcess = true;
      });

      LoginRequest model = LoginRequest(email: email!, password: password!);

      APIService.login(model).then((response) => {
            setState(() {
              isAPIcallProcess = false;
            }),
            if (response.message != "success")
              {onLoginFailed(response)}
            else
              {onLoginSuccess()}
          });
    }
  }

  void onLoginFailed(LoginResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onLoginSuccess() {
    print("Login success");
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
          UnconstrainedBox(
              child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            height: 100,
            width: 100,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 35),
            decoration: const BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: const Text("Logo",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
          )),
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
                      // Email or Username
                      Container(
                          margin: EdgeInsets.only(top: 40),
                          width: 222,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: blackColor))),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: "Email/Username",
                                hintText: 'you@gmail.com',
                                labelStyle: TextStyle(
                                    color: halfTransparant,
                                    fontFamily: 'inter',
                                    fontSize: 16)),
                            obscureText: false,
                            onSaved: (value) => email = value,
                          )),

                      //Password
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 222,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: blackColor))),
                          child: TextFormField(
                            validator: (String? value) {
                              currentPassword = value;
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: "Password",
                                hintText: "Enter your password",
                                labelStyle: TextStyle(
                                    color: halfTransparant,
                                    fontFamily: 'inter',
                                    fontSize: 16)),
                            obscureText: true,
                            onSaved: (value) => password = value,
                          )),

                      //Password Confirmation
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 222,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1, color: blackColor))),
                          child: TextFormField(
                            validator: (value) {
                              if (value != currentPassword) {
                                return "Password didn't match";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: "Confirm Password",
                                hintText: "Re-Enter your Password",
                                labelStyle: TextStyle(
                                    color: halfTransparant,
                                    fontFamily: 'inter',
                                    fontSize: 16)),
                            obscureText: true,
                            onSaved: (value) => password = value,
                          )),
                      SizedBox(
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
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
                            text: "Login",
                            color: acceptGreen,
                            onPressed: onSubmit,
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Haven't signed up?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            child: const Text(
                              "Sign in here",
                              style: TextStyle(
                                  color: linkColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
