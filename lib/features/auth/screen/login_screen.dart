import 'package:employee/features/auth/bloc/blocs/auth_bloc.dart';
import 'package:employee/features/auth/bloc/events/auth_event.dart';
import 'package:employee/features/auth/bloc/repository/auth_repository.dart';
import 'package:employee/features/auth/bloc/states/auth_state.dart';
import 'package:employee/routes/route_names.dart';
import 'package:employee/shared/widgets/k_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget with AuthRepository {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  KTextField(
                    hintText: "abc@gmail.com",
                    onChanged: (value) =>
                        context.read<AuthBloc>().add(EmailChanged(value)),
                    obscureText: false,
                    labelText: "Email",
                    validator: isEmailValid,
                  ),
                  const SizedBox(height: 16),
                  KTextField(
                    hintText: "********",
                    onChanged: (value) =>
                        context.read<AuthBloc>().add(PasswordChanged(value)),
                    obscureText: true,
                    labelText: "Password",
                    validator: isPasswordValid,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // context
                      //     .read<AuthBloc>()
                      //     .add(FormSubmitted(_formKey, context));
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, RouteNames.dashboard);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
