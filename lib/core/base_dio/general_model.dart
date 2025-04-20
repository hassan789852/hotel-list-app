
abstract class GeneralModel{

  GeneralModel();
  Map<String, dynamic> toJson();
  GeneralModel.fromJson(dynamic json);

  GeneralModel fromJson(dynamic json);
}