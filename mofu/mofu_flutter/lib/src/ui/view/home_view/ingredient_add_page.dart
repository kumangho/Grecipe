import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/controller/shelf_life_controller.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/home_view/home_page.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/ui/widget/LandingPage.dart';
import 'package:mofu_flutter/src/ui/widget/ingredient_add_icons.dart';
import 'package:mofu_flutter/src/ui/widget/shelf_life_toggle.dart';

class IngredientAddPage extends StatelessWidget {
  final shelfLifeController = Get.put(ShelfLifeController(), permanent: false);
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
                    Get.to(()=>LandingPage(), transition: Transition.cupertino);
                  },
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  '식재료 등록',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                          height: displayHeight * 0.15,
                          width: displayWidth * 0.8,
                          padding: EdgeInsets.only(top: displayHeight * 0.02),
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
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: '이름을 입력하세요.',
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
                                        alignment: Alignment.centerLeft,
                                        child: Text('아이콘으로 등록하기'),
                                      ),
                                      InkResponse(
                                        onTap: (){
                                          ingredientAddIconsDialog();
                                        },
                                        child: Container(
                                        height: displayHeight * 0.06,
                                        width: displayHeight * 0.06,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: subColor,
                                          border: Border.all(
                                              color: mainColor, width: 2),
                                        ),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/icons/ingredient_icon/bacon.png'),
                                        ),
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
                        Container(child: Text('유통기한 설정')),
                        Container(
                            //child: Obx(()=>ShelfLifeToggleBtn()),
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
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
