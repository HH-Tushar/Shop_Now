import 'package:flutter/material.dart';

import '../httpRequest/customHttp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isObsecure=true;
  bool isabsorbing=false;
  bool isValidUser=true;
  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AbsorbPointer(
        absorbing:isabsorbing ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome Back"),

            Form(
              //autovalidateMode: AutovalidateMode.values[],
                key: mykey,
                child: Column(children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter your Email",
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field must be filled up";
                      }
                      else if(!value.contains("@")){
                        return "Invalid User email";
                      }
                     else if(isValidUser==false){
                        return "Invalid User Info";
                      }
                    },

                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    obscureText: isObsecure,
                    decoration:  InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter your Password",
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isObsecure=!isObsecure;
                          });

                        }, icon: Icon(isObsecure==true?Icons.visibility:Icons.visibility_off_outlined))
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a valid Password";
                      }
                      else if(isValidUser==false){
                        return "Invalid User Info";
                      }
                    },
                  ),
                ],)),


            Container(
              width: 100,
              height: 40,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
              ),
              child: TextButton(
                  onPressed: () async {

                    if (mykey.currentState!.validate()) {
                     isabsorbing=true;
                     isValidUser= await CustomHttp.login(
                        emailController.text,
                        passwordController.text
                      );
                     print("validation of user is:$isValidUser");
                     if(isValidUser==false){ setState(() {
                       mykey.currentState!.validate();
                       isValidUser=true;
                     });}

                      isabsorbing=false;
                    }
                  },
                  child: const Text("Login",style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.w400),)),
            )

          ],
        ),
      ),
    );
  }
}
