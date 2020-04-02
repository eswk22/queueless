import 'package:flutter/material.dart';
import 'package:queueless/authentication/bloc/authentication_bloc.dart';
import 'package:queueless/authentication/widgets/home_screen.dart';
import 'package:queueless/authentication/widgets/splash_screen.dart';
import 'package:queueless/bloc/queueless_bloc_delegate.dart';
import 'package:queueless/login/widgets/login_screen.dart';
import 'package:queueless/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = QueuelessBlocDelegate();
  final UserRepository userRepository = UserRepository();
  
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  ); 
}


class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          return Container();
        },
      ),
    );
  }
}

