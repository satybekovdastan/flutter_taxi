import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:merphy/src/presentation/view/auth/widget/auth_widget.dart';
import 'package:merphy/src/presentation/view/auth/widget/verification_widget.dart';
import 'package:merphy/src/utils/logger.dart';

import '../../../../main.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/auth/verify/verify_cubit.dart';

class VerificationPage extends StatelessWidget {

  final String? phone;

  const VerificationPage({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<VerifyCubit>()..setPhoneNumber(phone),
      child: _VerificationPage(),
    );
  }
}
class _VerificationPage extends StatelessWidget {
  const _VerificationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          if (state is VerifyError) {
            logger.e("AuthError: ${state.message}");

            // Отложим отображение ошибки, чтобы избежать ошибки вызова во время построения
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showErrorAlert(context, state.message);
            });
          } else if (state is DidVerify) {
            _navigateToHome(context);
          }
        },
        buildWhen: (_, current) {
          return current is AuthInitial ||
              current is VerifyLoading ||
              current is VerifyError ||
              current is DidVerify ||
              current is VerifyLoaded;
        },
        builder: (context, state) {
          logger.e("Verify: $state");
          final authCubit = context.read<VerifyCubit>();

          return VerificationWidget(authCubit);
        },
      ),
    );
  }

  _navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      ),
          (route) => false,  // Удаляет все предыдущие экраны из стека
    );
  }
  void showErrorAlert(BuildContext context, String message) {
    // Отображаем AlertDialog только после завершения построения дерева виджетов
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    });
  }
}
