import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
      bool isLoggedIn = false;
      String name = '';
      String email = '' ;
      final _nameController = TextEditingController();
      final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

      Widget buildSuccess(){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle , color: Colors.green, size: 100),
            const SizedBox(height: 20),
            Text('Welcome , $name!' , style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('Email: $email' , style: const TextStyle(fontSize: 16)),
          ],
        );
      }
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

Widget buildLoginForm(){
  return Form(
    key: _formKey,
    child: Padding(padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder()
          ),
          validator: (text) => text!.isEmpty ? 'Username cannot blank' : null,
        ),
        const SizedBox(height: 20),
         TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder()
          ),
          validator: (text) 
          {
            if (text!.isEmpty){
              return 'Email cannot be blank' ;
          }
          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
          if (!emailRegex.hasMatch(text)){
            return 'invalid email formate' ;
          }
          return null;
          }
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: _validate ,
       child: const Text('login'))
      ],
    )
    ),
  );
} 

void _validate(){
  final form = _formKey.currentState ;
  if(form!.validate()){
    setState(() {
      isLoggedIn = true ;
      name = _nameController.text ;
      email = _emailController.text;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: A(
        Title(color: color, child: child)
      ),
      body: 
    );
}
}


