import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project1/constants/export.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   final cloudStore = FirebaseFirestore.instance;


  final _formKey = GlobalKey<FormState>();

  TextEditingController? usernameController;
  TextEditingController? passwordController;
  FocusNode? usernameNode;
  FocusNode? passwordNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController=TextEditingController();
    passwordController=TextEditingController();
    usernameNode=FocusNode();
    passwordNode=FocusNode();
    getData();

  }
   Future<void>getData() async {
     CollectionReference _collectionRef = cloudStore.collection('Paras');
     var  data =await _collectionRef.get();
     print(JsonDecoder());
   }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true
        ,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller:usernameController,
                focusNode: usernameNode,


                style: TextStyle(
                  fontSize: 15,


                ),
                decoration: InputDecoration(

                  hintText: "User Name",
                  fillColor: Colors.grey


                ),

              ),
              TextFormField(
                controller: passwordController,
                focusNode: passwordNode,


                style: TextStyle(
                  fontSize: 15,


                ),
                decoration: InputDecoration(

                    hintText: "Password",
                    fillColor: Colors.grey


                ),


              ),
              TextButton(
                  onPressed: () {

                    cloudStore.collection("Paras").doc("oooooo").set({

                      "Name":"PPPPPPPP",


                    });


                  /*  cloudStore.collection("Paras").doc("ccc").set({
                      "Name": "Paras Bhanot",

                    });*/


                    /*.add({
                      "Name": "Paras Bhanot",
                      "id":"2"
                    });*/
                      GetUtils.isLengthGreaterThan(usernameController!.text, 6) ? print('Name is valid') : print('Name is invalid!!!');
                      GetUtils.isAlphabetOnly(passwordController!.text) ? print('Password is Valid') : print('Password is not valid');




                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),

    );
  }
  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
}
