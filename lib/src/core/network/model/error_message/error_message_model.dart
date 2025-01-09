import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_message_model.g.dart';

@JsonSerializable()
class NetworkErrorMessageModel extends Equatable {
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'msg')
  final String? message;

  const NetworkErrorMessageModel({this.type, this.message});

  factory NetworkErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return _$NetworkErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkErrorModelToJson(this);

  @override
  List<Object?> get props => [type, message];
}
