import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/snack_bar_message.dart';
import '/features/auth/presentation/bloc/user_manager/user_manager_bloc.dart';
import '/features/auth/presentation/widgets/register_form.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserManagerBloc, UserManagerState>(
      listener: (context, state) {
        if (state is RegisteredUserState) {
          GoRouter.of(context).goNamed('login');
        }
        if (state is RegisterUserErrorState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      child: Scaffold(
        
        body: 
        Column(mainAxisAlignment: MainAxisAlignment.center,
          
          
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
             
            const Text("Register",textScaleFactor: 5.0),
            const SizedBox(
                      height: 8,
                    ),
            RegisterForm()
          ])
      ),
    );
  }
}
