
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget{
  const PasswordField({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<PasswordField>{
  var _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/img_login.jpg"),
              const Text(
                "Dev-1.0.0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                            "Mobile number",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey
                            ),
                          )
                      ),
                      TextField(
                        maxLines: 1,
                        maxLength: 11,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Enter Mobile Number",
                            counterText: "",
                            hintMaxLines: 1,
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1.0,
                                    color: Colors.lightBlueAccent
                                )
                            )
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey
                          ),
                        ),
                      ),
                      TextField(
                        maxLines: 1,
                        maxLength: 20,
                        obscureText: _isVisible,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            hintMaxLines: 1,
                            counterText: "",
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.lightBlueAccent,
                                    width: 1.0
                                )
                            ),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off)
                          )
                        ),
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                          ),
                            child: const Text("Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                "Dev-1.0.0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}