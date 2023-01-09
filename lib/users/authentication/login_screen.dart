import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/api_connection/api_connection.dart';
import 'package:getxapp/users/authentication/login_screen.dart';
import 'package:getxapp/users/authentication/signup_screen.dart';
import 'package:getxapp/users/fragments/dashboard_of_fragments.dart';
import 'package:getxapp/users/model/user.dart';
import 'package:getxapp/users/userPreferences/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );
      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(
              msg: "congratulation,you are login successfull");

          User userInfo = User.fromJson(resBodyOfLogin["userData"]);
          await RememberUserPrefs.saveRememberUser(userInfo);
          Future.delayed(Duration(milliseconds: 2000), () {
            Get.to(DashboardOfFragments());
          });
        } else {
          Fluttertoast.showToast(
              msg: "Error,\n put currect email and password and try again");
        }
      }
    } catch (errorMsg) {
      print("error::" + errorMsg.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(
          builder: (context, cons) {
            return ConstrainedBox(
                constraints: BoxConstraints(minHeight: cons.maxHeight),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // login header
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 285,
                        child: Image.asset(
                          "images/login.jpg",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.all(
                                Radius.circular(60),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black26,
                                  offset: Offset(0, -3),
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                            child: Column(
                              children: [
                                // email-pass login button
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        validator: (val) => val == ""
                                            ? "please write email"
                                            : null,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.black,
                                          ),
                                          hintText: "email@gmail.com",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 6,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Obx(
                                        () => TextFormField(
                                          controller: passwordController,
                                          obscureText: isObscure.value,
                                          validator: (val) => val == ""
                                              ? "please write password"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.black,
                                            ),
                                            suffixIcon:
                                                Obx(() => GestureDetector(
                                                    onTap: () {
                                                      isObscure.value =
                                                          !isObscure.value;
                                                    },
                                                    child: Icon(
                                                      isObscure.value
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                    ))),
                                            hintText: "password",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                color: Colors.white60,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                color: Colors.white60,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                color: Colors.white60,
                                              ),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                color: Colors.white60,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Material(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {
                                            if(formKey.currentState!.validate()){
                                            loginUserNow();

                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 28,
                                            ),
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // don't have button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have and account?"),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(
                                          SignUpScreen(),
                                        );
                                      },
                                      child: Text(
                                        "SignUp",
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Or",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                // admin
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Are you an admin?"),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Click here",
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
