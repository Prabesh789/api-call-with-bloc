import 'package:apicallwithbloc/domain/model/facts_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  int id;
  String category;
  List<Facts> facts;

  NewsModel({this.id, this.category, this.facts});
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
