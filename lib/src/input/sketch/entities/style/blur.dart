import 'package:json_annotation/json_annotation.dart';

part 'blur.g.dart';

@JsonSerializable()
class Blur {
  @JsonKey(name: '_class')
  final String? classField;
  final bool? isEnabled;
  final String? center;
  final double? motionAngle, radius, saturation, type;

  Blur(
      {this.center,
      this.classField,
      this.isEnabled,
      this.motionAngle,
      this.radius,
      this.saturation,
      this.type});

  factory Blur.fromJson(Map json) => _$BlurFromJson(json as Map<String, dynamic>);
  Map toJson() => _$BlurToJson(this);
}
