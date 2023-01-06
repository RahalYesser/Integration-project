import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/auth/domain/entities/user_entity.dart';
import '/features/auth/presentation/bloc/user_manager/user_manager_bloc.dart';
import '/features/auth/presentation/widgets/auth_btn.dart';
import 'package:validators/validators.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name Required';
                  }
                  return null;
                },
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Required';
                  }
                  if (!isEmail(value)) {
                    return "email Not Valid";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password required';
                  }
                  if (!isLength(value, 8)) {
                    return "weak password";
                  }
                  return null;
                },
                controller: _pwdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              /* child: ElevatedButton(
                onPressed: validateAndRegisterUser,
                child: const Text('Submit'),
              ), */
              child: BlocBuilder<UserManagerBloc, UserManagerState>(
                builder: (context, state) {
                  if (state is RegisteringUserState) {
                    return const CircularProgressIndicator(
                      color: Colors.green,
                    );
                  } else {
                    return AuthButton(
                        text: "Register",
                        onPressed: validateAndRegisterUser,
                        color: Colors.blue);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateAndRegisterUser() {
    if (_formKey.currentState!.validate()) {
      final user = UserEntity(
          name: _nameController.text,
          email: _emailController.text,
          password: _pwdController.text);

      BlocProvider.of<UserManagerBloc>(context).add(RegisterEvent(user: user));
    }
  }
}
