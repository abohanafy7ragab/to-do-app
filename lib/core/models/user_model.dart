import 'package:hive_ce/hive.dart';
import 'package:image_picker/image_picker.dart';
part 'user_model.g.dart';
@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  XFile? photo;
  UserModel({this.name, this.photo});
}
