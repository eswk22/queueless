import 'package:flutter/material.dart';
import 'package:queueless/screens/register/register_screen.dart';
import 'package:user_repository/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  final AuthRepository _authRepository;

  CreateAccountButton({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(authRepository: _authRepository);
          }),
        );
      },
    );
  }
}
