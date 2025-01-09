import 'package:flutter/material.dart';
import 'package:merphy/src/presentation/cubit/auth/auth_cubit.dart';

import '../../../_widget/edit_text.dart';
import '../../../cubit/auth/verify/verify_cubit.dart';

class VerificationWidget extends StatefulWidget {
  final VerifyCubit cubit;
  final GestureTapCallback? onTap;

  const VerificationWidget(
    this.cubit, {
    super.key,
    this.onTap,
  });

  @override
  State<VerificationWidget> createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
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
              labelText: "Code",
              keyboardType: TextInputType.number,
              onChanged: (v) => widget.cubit.setCode(v),
            ),
            ElevatedButton(
              onPressed: () async {
                widget.cubit.verifyCode();
              },
              child: Text('Send'),
            ),
          ],
        ));
  }
}
