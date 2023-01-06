import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/auth/presentation/bloc/auth/auth_bloc.dart';
import '/features/auth/presentation/widgets/login_form.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/core/utils/snack_bar_message.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          GoRouter.of(context).goNamed('profile');
        } else if (state is AuthErrorState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/logo.png'))),
              ),
              const Text(
                "Learning App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(
                height: 30,
              ),
              LoginForm(),
              
              // ignore: prefer_const_constructors
              Text(
                'Not a member? ',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).goNamed("register");
                  },
                  child: const Text('register here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      )))
            ]),
      ),
    );
  }
}
