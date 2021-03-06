import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:grecipe/src/controller/ingredient_DB_controller.dart';
import 'package:grecipe/src/controller/food_vision_ing_controller.dart';
import 'package:grecipe/src/ui/view/foodvision_view/food_vision_page.dart';

void ingredientAddIconsDialog() {
  final ingDbController = Get.put(IngredientDBController(), permanent: false);
  final fvingController = Get.put(FoodVisionIngController(),permanent: false);
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return mainColor;
  }

  cusExpansionTile(title, ingredientList) {
    return ExpansionTile(
      textColor: mainColor,
      title: Text('$title'),
      children: [
        SizedBox(
          height: displayHeight * 0.2,
          width: displayWidth * 0.7,
          child: GridView.builder(
              itemCount: ingredientList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: displayWidth * 0.02,
                  mainAxisExtent: displayHeight * 0.092,
                  mainAxisSpacing: displayHeight * 0.02),
              itemBuilder: (BuildContext context, int index) {
                return InkResponse(
                  onTap:() {
                    fvingController.fvSelectedIcon.value = ingredientList[index];
                    ingDbController.selectedIcon.value = ingredientList[index];
                    print('${toKorean(fvingController.fvSelectedIcon.value)}');
                    print('selectedIcon : ${ingDbController.selectedIcon}.');
                  },
                    child: Column(children: [Container(
                  height: displayHeight * 0.066,
                  width: displayWidth * 0.16,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: subColor,
                    border: Border.all(color: mainColor, width: 2),
                  ),
                  child: Image(
                    image: AssetImage(
                        'assets/images/icons/ingredient_icon/${ingredientList[index]}.png'),
                  ),
                ),
                Container(
            child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('${ingredientList[index]}'),
        ))]));
              }),
        )
      ],
    );
  }

  Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: mainColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(40.0))),
      //title: Text('??????????????? ????????????', style: TextStyle(fontSize: displayHeight * 0.03, color: mainColor, fontWeight: FontWeight.bold),),
      child: SingleChildScrollView(
        child: SizedBox(
          width: displayWidth * 0.8,
          height: displayHeight * 0.6,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                height: displayHeight * 0.07,
                child: Center(
                  child: Text(
                    '??????????????? ????????????',
                    style: TextStyle(
                      fontSize: displayHeight * 0.02,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  height: displayHeight * 0.4,
                  child: ListView(
                    children: [
                      cusExpansionTile('??????', ingList_vegetable),
                      cusExpansionTile('???????????????????', ingList_fruit),
                      cusExpansionTile('?????????????????????????', ingList_fisheries),
                      cusExpansionTile('??????????????', ingList_meat),
                      cusExpansionTile('??????????????', ingList_seasoning),
                      cusExpansionTile('?????????????????', ingList_processedfood),
                      cusExpansionTile('??????????????', ingList_beverage),
                    ],
                  )),
              Container(
                child: Center(
                  child: SizedBox(
                    height: displayHeight * 0.05,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(mainColor),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.resolveWith(getColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: mainColor, width: 2))),
                      ),
                      child: Text(
                        '??????',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: displayHeight * 0.025),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )));
}
