import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv1/features/auth/presentation/widgets/login_form_admin.dart';

import '/features/auth/presentation/bloc/auth/auth_bloc.dart';
import '/features/auth/presentation/widgets/login_form_admin.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

import '/core/utils/snack_bar_message.dart';

class LoginPageAdmin extends StatelessWidget {
  
  const LoginPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          GoRouter.of(context).goNamed('admin');
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
                height: 10,
              ),
              const Text(
                "You're an Admin !",
                style: TextStyle(fontWeight:FontWeight.w500 , fontSize: 15, color: Colors.orange),
                
              ),
              LoginFormAdmin(),
            

            ]),
      ),
    );
  }
  
}
