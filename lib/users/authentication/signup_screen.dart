import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/users/authentication/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        body: LayoutBuilder(
          builder: (context, cons) {
            return ConstrainedBox(
                constraints: BoxConstraints(minHeight: cons.maxHeight),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // signup header
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 285,
                        child: Image.asset(
                          "images/register.jpg",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white60,
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
                                //name- email-pass signup button
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: nameController,
                                        validator: (val) => val == ""
                                            ? "please enter name"
                                            : null,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.black,
                                          ),
                                          hintText: "name",
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
                                          onTap: () {},
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 28,
                                            ),
                                            child: Text(
                                              'SignUp',
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
                                    Text("Already have an account?"),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(LoginScreen());
                                      },
                                      child: Text(
                                        "Login here",
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Text(
                                //   "Or",
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 16,
                                //   ),
                                // ),
                                // // admin
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text("Are you an admin?"),
                                //     TextButton(
                                //       onPressed: () {},
                                //       child: Text(
                                //         "Click here",
                                //         style: TextStyle(
                                //           color: Colors.orangeAccent,
                                //           fontSize: 16,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
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
