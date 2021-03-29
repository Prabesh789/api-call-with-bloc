import 'package:json_annotation/json_annotation.dart';
part 'facts_model.g.dart';

@JsonSerializable()
class Facts {
  int id;
  String title;
  String description;
  String image_url;

  Facts({this.id, this.title, this.description, this.image_url});
  factory Facts.fromJson(Map<String, dynamic> json) => _$FactsFromJson(json);
  Map<String, dynamic> toJson() => _$FactsToJson(this);
}
