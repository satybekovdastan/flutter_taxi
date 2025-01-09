import 'package:flutter/material.dart';
import 'package:merphy/src/presentation/cubit/auth/auth_cubit.dart';

import '../../../_widget/edit_text.dart';

class AuthWidget extends StatefulWidget {
  final AuthCubit cubit;
  final GestureTapCallback? onTap;

  const AuthWidget(
    this.cubit, {
    super.key,
    this.onTap,
  });

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditText(
              labelText: "Phone Number",
              keyboardType: TextInputType.phone,
              onChanged: (v) => widget.cubit.setPhoneNumber(v),
            ),
            ElevatedButton(
              onPressed: () async {
                widget.cubit.loginSendCode();
              },
              child: Text('Next'),
            ),
          ],
        ));
  }
}
