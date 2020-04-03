import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queueless/blocs/register/register_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  final AuthRepository _authRepository;

  RegisterScreen({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(authRepository: _authRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
