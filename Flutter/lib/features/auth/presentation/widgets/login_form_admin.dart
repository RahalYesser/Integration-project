import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv1/core/strings/admin_password.dart';
import '/features/auth/presentation/bloc/auth/auth_bloc.dart';
import '/features/auth/presentation/widgets/auth_btn.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

class LoginFormAdmin extends StatefulWidget {
  const LoginFormAdmin({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }

}

class LoginFormState extends State<LoginFormAdmin> {
       final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return 'Key Required'; //dans le dossier Strings
                }
                if (value!=ADMIN_KEY) {
                  return "Incorrect key";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the Key',
              ),
            ),
          ),
        
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            /* child: ElevatedButton(
              onPressed: validateAndLoginUser,
              child: const Text('Login'),
            ), */
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is LoginProgressState) {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                } else {
                  return AuthButton(
                     
                      text: "Login",
                      onPressed: validateAndLoginAdmin ,
                      color: Colors.blue); 
                }
              },
            ),
          ),
        ],
      ),
    );
  }
void validateAndLoginAdmin() {
    if (_formKey.currentState!.validate()) {
      
        GoRouter.of(context).goNamed("admin");
  
    }
  }
 
}


  

  

  

 



