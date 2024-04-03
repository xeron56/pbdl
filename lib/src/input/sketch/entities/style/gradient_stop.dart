import 'package:json_annotation/json_annotation.dart';
import 'color.dart';

part 'gradient_stop.g.dart';

@JsonSerializable()
class GradientStop {
  @JsonKey(name: '_class')
  final String? classField;
  final double? position;
  final Color? color;

  GradientStop({this.classField, this.color, this.position});

  factory GradientStop.fromJson(Map json) => _$GradientStopFromJson(json as Map<String, dynamic>);
  Map toJson() => _$GradientStopToJson(this);
}
