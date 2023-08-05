import 'package:flutter/material.dart';
import '../../model/login_model.dart';
import '../../services/api_service.dart';
import '../../widgets/normal_button.dart';
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
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            UnconstrainedBox(
                child: Container(
              margin: const EdgeInsets.only(bottom: 40),
              height: 100,
              width: 100,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 35),
              decoration: BoxDecoration(
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
                        FieldOfText(
                          TopMargin: 40,
                          labelText: 'E-mail Address',
                          hintText: 'you@example.com',
                          saveValue: email,
                          TextCencored: false,
                          inputType: TextInputType.emailAddress,
                        ),
                        FieldOfText(
                            TopMargin: 20,
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                            saveValue: password,
                            TextCencored: true),
                        FieldOfText(
                            TopMargin: 20,
                            labelText: 'Re-Enter your Password',
                            hintText: 'Please Re-Enter your Password',
                            saveValue: password,
                            TextCencored: true),
                        SizedBox(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            height: 34,
                            width: 178,
                            decoration: const BoxDecoration(
                                color: greyColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: NormalButton(
                              onPressed: onSubmit,
                              text: "Login",
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("or", textAlign: TextAlign.center),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
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
      )),
    );
  }
}

class FieldOfText extends StatelessWidget {
  final double TopMargin;
  final String? labelText;
  final String? hintText;
  final bool TextCencored;
  String? saveValue;
  TextInputType? inputType = null;
  FieldOfText(
      {required this.TopMargin,
      required this.labelText,
      required this.hintText,
      super.key,
      required this.saveValue,
      this.inputType,
      required this.TextCencored});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: TopMargin),
        width: 222,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: blackColor))),
        child: TextFormField(
          keyboardType: inputType,
          decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: const TextStyle(
                  color: Colors.black, fontFamily: 'inter', fontSize: 16)),
          obscureText: TextCencored,
          onSaved: (value) => saveValue = value,
        ));
  }
}
