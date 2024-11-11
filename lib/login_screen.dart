
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mobile number",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey
                        ),
                      ),
                      TextField(
                        maxLines: 1,
                        maxLength: 11,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Enter Mobile Number",
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
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey
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
                      SizedBox(
                        width: double.infinity,
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