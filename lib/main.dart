import 'package:flutter/material.dart';
import 'package:queueless/blocs/authentication/authentication_bloc.dart';
import 'package:queueless/blocs/queueless_bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queueless/screens/home_screen.dart';
import 'package:queueless/screens/login/login_screen.dart';
import 'package:queueless/screens/splash_screen.dart';
import 'package:user_repository/user_repository.dart';


void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = QueuelessBlocDelegate();
  final AuthRepository authRepository = FirebaseAuthRepository();
  
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(authRepository: authRepository)
        ..add(AppStarted()),
      child: App(authRepository: authRepository),
    ),
  ); 
}


class App extends StatelessWidget {
  final AuthRepository _authRepository;

  App({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
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
            return LoginScreen(authRepository: _authRepository);
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

