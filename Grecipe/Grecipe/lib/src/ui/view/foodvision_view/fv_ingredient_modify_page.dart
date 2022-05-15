import 'package:flutter/material.dart';
import 'package:grecipe/src/controller/shelf_life_controller.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/ui/view/foodvision_view/food_vision_page.dart';
import 'package:grecipe/src/ui/widget/landing_page.dart';
import 'package:grecipe/src/ui/widget/ingredient_add_icons.dart';
import 'package:grecipe/src/controller/food_vision_ing_controller.dart';

class FvIngredientModifyPage extends StatelessWidget {
  final shelfLifeController = Get.put(ShelfLifeController(), permanent: false);
  final fvingController = Get.put(FoodVisionIngController(),permanent: false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: SafeArea(
          bottom: false,
          child: Container(
            color: Colors.white,
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  color: mainColor,
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  '식재료 수정',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                          height: displayHeight * 0.15,
                          width: displayWidth * 0.8,
                          padding: EdgeInsets.only(top: displayHeight * 0.03),
                          child: Container(
                              height: displayHeight * 0.2,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('이름 입력'),
                                        padding: EdgeInsets.only(
                                            bottom: displayHeight * 0.01),
                                      ),
                                      Container(
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                left: 5, right: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: textfieldColor,
                                            ),
                                            width: displayWidth * 0.34,
                                            height: displayHeight * 0.06,
                                            child: TextFormField(
                                              controller: ingname,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: '이름을 입력하세요.',
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        displayHeight * 0.013),
                                              ),
                                            )),
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: displayHeight * 0.01),
                                        alignment: Alignment.centerLeft,
                                        child: Text('아이콘으로 등록하기'),
                                      ),
                                      InkResponse(
                                          onTap: () {
                                            ingredientAddIconsDialog();
                                          },
                                          child: Container(
                                            height: displayHeight * 0.06,
                                            width: displayHeight * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: subColor,
                                              border: Border.all(
                                                  color: mainColor, width: 2),
                                            ),
                                            child: Obx(()=>Image(
                                              image: AssetImage(
                                                  'assets/images/icons/ingredient_icon/${toKorean(fvingController.fvSelectedIcon.value)}.png'),
                                            )),
                                          ))
                                    ],
                                  ))
                                ],
                              )))),
                  Center(
                      child: Container(
                    width: displayWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text('유통기한 설정'),
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.01),
                        ),
                        Container(
                          height: displayHeight * 0.06,
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.03),
                          child: Obx(() => ToggleButtons(
                              borderRadius: BorderRadius.circular(20),
                              borderWidth: 2,
                              borderColor: mainColor,
                              selectedBorderColor: mainColor,
                              color: mainColor,
                              hoverColor: mainColor,
                              selectedColor: mainColor,
                              focusColor: mainColor,
                              fillColor: mainColor,
                              children: [
                                Image.asset(
                                  "assets/images/icons/expiration_icon/good_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/icons/expiration_icon/danger_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/images/icons/expiration_icon/fridged_1.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                              onPressed: (int index) {
                                shelfLifeController.changeTabIndex(index);
                              },
                              isSelected:
                                  shelfLifeController.isSelected.toList())),
                        ),
                      ],
                    ),
                  )),
                  Center(
                      child: Container(
                    width: displayWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(bottom: displayHeight * 0.01),
                          child: Text('메모'),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: textfieldColor,
                            ),
                            width: displayWidth * 0.8,
                            height: displayHeight * 0.2,
                            child: TextFormField(
                              controller: ingmemo,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '내용을 입력하세요.',
                              ),
                            )),
                      ],
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: displayHeight * 0.2),
                  ),
                  Center(
                      child: Container(
                          width: displayWidth * 0.8,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: TextButton(
                                        onPressed: () => {
                                          fvingController.deleteFvIng(fvingController.fvSelectedIndex.value),
                                           Get.to(()=>LandingPage(),
                                 transition: Transition.cupertino)},
                                        child: Text(
                                          '삭제하기',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: displayHeight * 0.02),
                                        ))),
                                Container(
                                    child: TextButton(
                                        onPressed: () => {
                                          fvingController.updateFvIng(fvingController.fvSelectedIndex.value),
                                           Get.to(()=>LandingPage(),
                                 transition: Transition.cupertino)},
                                        child: Text(
                                          '등록하기',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: displayHeight * 0.02),
                                        )))
                              ])))
                ],
              )),
            ),
          )),
    );
  }
}