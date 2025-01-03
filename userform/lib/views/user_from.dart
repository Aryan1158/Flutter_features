import 'package:flutter/material.dart';
import 'package:userform/extensions/extensions.dart';

class UserFromScreen extends StatefulWidget {
  const UserFromScreen({Key? key}) : super(key: key);

  @override
  State<UserFromScreen> createState() => _UserFromScreenState();
}

class _UserFromScreenState extends State<UserFromScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User From"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("User Name"),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                // maxLength: 10,
                controller: userName,
                decoration: InputDecoration(
                  hintText: "Enter User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Password"),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter User Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.isPasswprd) {
                    return 'Please enter valid user Password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Email"),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                // maxLength: 10,
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.isValidEmail) {
                    return 'Please enter valid Email';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Validated");

                    print(
                        " User Name ${userName.text}, Password ${password.text}");

                    Map userRequiredData = {
                      "user_name": userName.text,
                      "password": password.text
                    };

                    print(userRequiredData);
                  } else {
                    print("Not Validated");
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
