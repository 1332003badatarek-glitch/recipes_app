import 'package:json_annotation/json_annotation.dart';
import 'recipes_model.dart';

part 'recipes_response_model.g.dart';

@JsonSerializable()
class RecipesResponseModel {
  final List<RecipesModel> recipes;

  RecipesResponseModel({required this.recipes});

  factory RecipesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesResponseModelToJson(this);
}
