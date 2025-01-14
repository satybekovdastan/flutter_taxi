import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:merphy/src/presentation/view/auth/verification_page.dart';
import 'package:merphy/src/presentation/view/auth/widget/auth_widget.dart';
import 'package:merphy/src/presentation/view/auth/widget/verification_widget.dart';
import 'package:merphy/src/utils/logger.dart';

import '../../cubit/auth/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthCubit>(),
      child: _AuthPage(),
    );
  }
}

class _AuthPage extends StatelessWidget {
  const _AuthPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        title: Text("Auth"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        buildWhen: (_, current) {
          return current is AuthInitial ||
              current is AuthLoading ||
              current is AuthError ||
              current is AuthCodeSent ||
              current is AuthLoaded;
        },
        listener: (context, state) {
          logger.e("Auth: $state");
          if (state is AuthCodeSent) {
            final authCubit = context.read<AuthCubit>();
            showVerificationPage(context, authCubit.phone);
          } else if (state is AuthError) {
            showErrorAlert(context, state.message);
          }
        },
        builder: (context, state) {
          final authCubit = context.read<AuthCubit>();
          return AuthWidget(authCubit);
        },
      ),
    );
  }

  void showVerificationPage(BuildContext context, String phone) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationPage(phone: phone),
        ),
      );
    });
  }
    void showErrorAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


}
