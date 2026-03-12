import 'package:get/get.dart';

class GenderSelectController extends GetxController {
  final selectedGender = RxnString();

  void selectGender(String gender) => selectedGender.value = gender;
}
