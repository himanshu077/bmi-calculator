import 'package:bmi_calculator/components/coreComponents/TapWidget.dart';
import 'package:bmi_calculator/presentation/home/HistoryView.dart';
import 'package:bmi_calculator/presentation/home/ProfileCtrl.dart';
import 'package:bmi_calculator/presentation/home/ProfileView.dart';
import 'package:bmi_calculator/presentation/home/ResultView.dart';
import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/constant/AppColors.dart';
import '../../components/constant/AppFonts.dart';
import '../../components/constant/AppIcons.dart';
import '../../components/constant/TextStyles.dart';
import '../../components/constant/constants.dart';
import '../../components/coreComponents/AppButton.dart';
import '../../components/coreComponents/ImageView.dart';
import '../../components/coreComponents/TextView.dart';
import 'MeasurementCtrl.dart';

class MeasurementsView extends StatefulWidget {
  const MeasurementsView({super.key});

  @override
  State<MeasurementsView> createState() => _MeasurementsViewState();
}

class _MeasurementsViewState extends State<MeasurementsView> {
  final measCtrl = Get.put(MeasurementCtrl());


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserView(),
          Obx(
            () => _GenderButton(
              value: measCtrl.gender,
              onTap: measCtrl.onSelectGender,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Obx(
                () => _HeightView(
                  onTap: measCtrl.onSelectHeightType,
                  measureType: measCtrl.heightType,
                ),
              )),
              SizedBox(
                width: AppFonts.s10,
              ),
              Expanded(
                  child: Obx(
                () => _WeightView(
                  onTap: measCtrl.onSelectWeightType,
                  measureType: measCtrl.weightType,
                ),
              ))
            ],
          ),
          _AgeView(),

          AppButton(
            label: 'Calculate',
            radius: AppFonts.s30,
            onTap: () => context.pushNavigator(const ResultView()),
          ),
          AppButton(
            label: 'History',
            radius: AppFonts.s30,
            margin: const EdgeInsets.only(top: AppFonts.s20),
            onTap: () => context.pushNavigator(const HistoryView()),
          )
        ],
      ),
    );
  }
}


class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(AppFonts.s16),
          margin: EdgeInsets.only(top: AppFonts.s10, bottom: AppFonts.s30),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppFonts.s16)
          ),
          child: Row(
            children: [
              ImageView(url: AppIcons.user, size: AppFonts.s30,margin: EdgeInsets.only(right: AppFonts.s10),),
              Expanded(child:
              Obx(
                ()=> TextView(text: profCtrl.name.isNotEmpty ? profCtrl.name : profCtrl.email,
                  textStyle: TextStyles.medium16TextHint,),
              ))
            ],
          ),
        ),
        Positioned.fill(child: TapWidget(
          onTap: ()=> context.pushNavigator(const ProfileView()),
        ))
      ],
    );
  }
}


class _GenderButton extends StatelessWidget {
  final GenderEnum value;
  final Function(GenderEnum) onTap;

  const _GenderButton({
    super.key,
    required this.value,
    required this.onTap,
  });

  Widget button(
      {required String icon, required bool status, required Function() onTap}) {
    return AppButton(
      fillWidth: false,
      buttonColor: status ? AppColors.primaryGreen : AppColors.transparent,
      padding: const EdgeInsets.symmetric(
          horizontal: AppFonts.s40, vertical: AppFonts.s10),
      onTap: onTap,
      radius: AppFonts.s20,
      child: ImageView(
        url: icon,
        size: AppFonts.s18,
        tintColor: status ? AppColors.white : AppColors.primaryGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            _header('Gender:'),
            Container(
              margin: const EdgeInsets.only(top: 3),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: AppColors.grey50),
                  borderRadius: BorderRadius.circular(AppFonts.s22)),
              child: Row(
                children: [
                  button(
                    icon: AppIcons.male,
                    status: GenderEnum.male == value,
                    onTap: () => onTap(GenderEnum.male),
                  ),
                  button(
                    icon: AppIcons.female,
                    status: GenderEnum.female == value,
                    onTap: () => onTap(GenderEnum.female),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeightView extends StatelessWidget {
  final HeightEnum measureType;
  final Function(HeightEnum) onTap;

  const _HeightView(
      {super.key, required this.measureType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppFonts.s30,
      ),
      padding: const EdgeInsets.all(AppFonts.s10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppFonts.s10)),
      child: Column(
        children: [
          _header("Height"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: AppFonts.s20, right: AppFonts.s10),
                  height: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.grey10,
                      borderRadius: BorderRadius.circular(AppFonts.s10)),
                  child: SizedBox(
                    child: measureType == HeightEnum.inch
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 45,
                                child: _Wheel(
                                    unit: "'",
                                    list: Height.feet,
                                    itemExtent: 30),
                              ),
                              SizedBox(
                                  width: 45,
                                  child: _Wheel(
                                      unit: "''",
                                      list: Height.inches,
                                      itemExtent: 30))
                            ],
                          )
                        : SizedBox(
                            width: 90,
                            child: _Wheel(
                                unit: "cm", list: Height.cms, itemExtent: 30)),
                  ),
                ),
              ),
              SizedBox(
                width: 52,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buttonType('ft', measureType == HeightEnum.inch,
                        () => onTap(HeightEnum.inch),
                        fillWidth: true),
                    const SizedBox(
                      height: AppFonts.s10,
                    ),
                    _buttonType('cm', measureType == HeightEnum.cm,
                        () => onTap(HeightEnum.cm),
                        fillWidth: true),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _WeightView extends StatelessWidget {
  final WeightEnum measureType;
  final Function(WeightEnum) onTap;

  const _WeightView(
      {super.key, required this.measureType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppFonts.s40,
      ),
      padding: const EdgeInsets.all(AppFonts.s10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppFonts.s10)),
      child: Column(
        children: [
          _header("Weight"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: AppFonts.s20, right: AppFonts.s10),
                  height: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.grey10,
                      borderRadius: BorderRadius.circular(AppFonts.s10)),
                  child: SizedBox(
                    child: measureType == WeightEnum.kg ?_Wheel(
                        unit: "kg",
                        list: Weight.kg,
                        itemExtent: 30) : _Wheel(
                        unit: "lbs",
                        list: Weight.lbs,
                        itemExtent: 30)
                  ),
                ),
              ),
              SizedBox(
                width: 52,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buttonType('kg', measureType == WeightEnum.kg,
                            () => onTap(WeightEnum.kg),
                        fillWidth: true),
                    const SizedBox(
                      height: AppFonts.s10,
                    ),
                    _buttonType('lbs', measureType == WeightEnum.lbs,
                            () => onTap(WeightEnum.lbs),
                        fillWidth: true),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _AgeView extends StatelessWidget {

  const _AgeView(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppFonts.s40 * 2,
      ),
      padding: const EdgeInsets.all(AppFonts.s10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppFonts.s10)),
      child: Column(
        children: [
          _header("Age"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: AppFonts.s20),
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.grey10,
                      borderRadius: BorderRadius.circular(AppFonts.s10)),
                  child: _Wheel(
                      unit: "",
                      list: Age.age,
                      itemExtent: 70,
                    isHorizontal: true,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _header(String title) => TextView(
      text: title,
      textStyle: TextStyles.medium16TextHint,
    );

Widget _buttonType(String label, bool status, Function() onTap,
    {bool fillWidth = false}) {
  return AppButton(
    onTap: onTap,
    label: label,
    labelStyle: status ? TextStyles.regular10White : TextStyles.regular10Black,
    fillWidth: fillWidth,
    buttonColor: status ? null : AppColors.grey20,
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: AppFonts.s16),
    radius: AppFonts.s20,
  );
}

class _Wheel extends StatelessWidget {
  final bool isHorizontal;
  final String unit;
  final List list;
  final double itemExtent;

  const _Wheel(
      {super.key,
      this.isHorizontal = false,
      required this.unit,
      required this.list,
      required this.itemExtent});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: isHorizontal ? 1 : 0,
      child: CupertinoPicker(
        itemExtent: itemExtent,
        looping: true,
        diameterRatio: 100,
        squeeze: 1,
        selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(background: Colors.transparent,),
        onSelectedItemChanged: (int index) {
          // if (_formKey.currentState!.validate()) {
          const Text(
            "Please select Weight",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          );
          // }
          // setState(
          //       () {
          //     if (_selectedUnits == 'Kgs') {
          //       _selectedWeight = kgs[index];
          //     } else {
          //       _selectedWeight = lbs[index];
          //     }
          //   },
          // );
        },
        children: List<Widget>.generate(
          list.length,
          (int index) {
            final value = '${isHorizontal ? list.reversed.toList()[index] : list[index]} $unit'.trim();
            return Center(
              child: RotatedBox(
                quarterTurns: isHorizontal ? 3 : 0,
                child: TextView(
                  text: value,
                  textStyle: TextStyles.regular16Black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
