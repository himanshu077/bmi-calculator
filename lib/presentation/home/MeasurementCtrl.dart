import 'package:get/get.dart';

import '../../components/constant/constants.dart';


class MeasurementCtrl extends GetxController{

  // by default gender value will be male...
  final Rx<GenderEnum> _gender = Rx<GenderEnum>(GenderEnum.male);
  GenderEnum get gender => _gender.value;

  final Rx<HeightEnum> _heightType = Rx<HeightEnum>(HeightEnum.inch);
  HeightEnum get heightType => _heightType.value;

  final Rx<WeightEnum> _weightType = Rx<WeightEnum>(WeightEnum.kg);
  WeightEnum get weightType => _weightType.value;



  void onSelectGender(GenderEnum value){
    _gender.value = value;
  }

  void onSelectHeightType(HeightEnum value){
    _heightType.value = value;
  }

  void onSelectWeightType(WeightEnum value){
    _weightType.value = value;
  }
}


getHeightListFT(){

}