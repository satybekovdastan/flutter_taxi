import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../error_message/error_message_model.dart';

part 'error_detail_model.g.dart';

@JsonSerializable()
class NetworkErrorDetailModel extends Equatable {
  @JsonKey(name: 'detail')
  final List<NetworkErrorMessageModel>? detail;

  const NetworkErrorDetailModel({this.detail});

  factory NetworkErrorDetailModel.fromJson(Map<String, dynamic> json) {
    return _$NetworkErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkErrorModelToJson(this);

  @override
  List<Object?> get props => [detail];
}
