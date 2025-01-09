import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merphy/src/domain/entities/auth/auth_entity.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

import '../../../../domain/usecases/auth/auth_usecases.dart';
import '../../../../utils/logger.dart';


part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this._authUsecases) : super(VerifyInitial());


  Future<void> verifyCode() async {
    if (phone.isEmpty) {
      emit(const VerifyError(message: "Filed is Empty"));
    }
    if (code.isEmpty) {
      emit(const VerifyError(message: "Field is Empty"));
    }
    try {
      emit(const VerifyLoading());
      final result = await _authUsecases.verifyCode(phone: phone, code: code);
      result.fold(
        (error) => emit(VerifyError(message: error.message)),
        (success) =>

          emit(DidVerify(item: success))

        ,
      );
    } catch (_) {
      rethrow;
    }
  }

  String phone = '';
  String code = '';

  void setPhoneNumber(String? v) {
    logger.e("phone: $v");
    if (v != null) {
      phone = v;
    }
  }

  void setCode(String v) {
    logger.e("code: $v");
    code = v.trim();
  }

  final AuthUsecases _authUsecases;
}
