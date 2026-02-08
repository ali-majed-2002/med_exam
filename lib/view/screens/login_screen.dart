import 'package:flutter/material.dart';
import 'package:mid_ex_flutter/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: const Image(
                image: AssetImage("image/img_1.png"),
                height: 40,
                width: 140,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff394144),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("New Account",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      ),
                      SizedBox(height: 32,),
                      Text("Full Name",style: TextStyle(
                        color: Colors.white,
                          fontSize: 14
                      ),)
                      ,TextField(
                        controller: emailController,

                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                              fontSize: 12

                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 33),
                      Text("Password",style: TextStyle(
                        color: Colors.white,
                          fontSize: 14

                      ),),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                              fontSize: 12
                          ),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Fluttertoast.showToast(msg: "نسيت كلمة المرور؟");
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xfff58632),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size(double.infinity, 50),
                            backgroundColor: const Color(0xFF059372),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            bool success = loginProvider.login(
                              emailController.text,
                              passwordController.text,
                            );
                            Fluttertoast.showToast(
                              msg: success
                                  ? "Login success"
                                  : "Login filed",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "new member");
                          },
                          child: const Text(
                            'New Member?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "create new account");
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xfff58632),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
