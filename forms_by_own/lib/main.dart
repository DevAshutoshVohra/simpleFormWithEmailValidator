import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyForm(),
      ),
    ),
  );
}

/*
3 easy steps to create a form


s-1 creat a form global key
 to uniquely identify your form


S-2 pass the global key to your form 



s-3 create a textField with validation Logic



s-4   create a button to validate and submit the form







 */

class MyForm extends StatelessWidget {
  MyForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.network(
              'https://img.freepik.com/free-vector/locker_53876-25496.jpg'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(autofillHints: [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please Enter Email';
                if( !EmailValidator.validate(value))return'Enter a Valid Email';


                return null;
              },
              decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  prefixIcon:const Icon(Icons.email),
                  hintText: 'xyz@gmail.com',
                  hoverColor: Colors.red),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Processing'),
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
