import 'package:flutter/material.dart';
import 'package:mofu_flutter/src/data/list.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_add_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/ingredient_modify_page.dart';
import 'package:mofu_flutter/src/ui/view/home_view/recipe_page.dart';
import 'package:get/get.dart';
import 'package:mofu_flutter/src/controller/shelf_life_index_controller.dart';
import 'package:mofu_flutter/src/controller/mytabcontroller.dart';
import 'package:mofu_flutter/src/data/model/recipe_model.dart' hide Row;
import 'package:mofu_flutter/src/controller/recipe_controller.dart';

class HomePage extends StatelessWidget {
  final recipeController = Get.put(RecipeController(), permanent: false);
  final shelfLifeIndexController =
      Get.put(ShelfLifeIndexController(), permanent: false);
  final MyTabController _tabx = Get.put(MyTabController());
  final List<String> entries = <String>['스팸 김치 볶음밥', '스팸 김치찌개'];

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mainColor,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    '우리집 냉장고',
                    style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: displayHeight * 0.02),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                    child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset('assets/images/banners/temp.png'),
                      SizedBox(
                        height: displayHeight * 0.06,
                        child: Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '등록된 재료 목록',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: displayHeight * 0.02),
                          ),
                        ),
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        child: Text(
                          'Sort by : life',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.01),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        height: displayHeight * 0.018,
                        child: SizedBox(
                            width: displayWidth * 0.6,
                            child: TabBar(
                                unselectedLabelColor: mainColor,
                                labelPadding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: mainColor),
                                indicatorSize: TabBarIndicatorSize.tab,
                                isScrollable: false,
                                controller: _tabx.controller,
                                tabs: _tabx.myTabs)),
                        alignment: Alignment.bottomLeft,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        height: 2,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      SizedBox(
                          width: displayWidth * 0.8,
                          height: displayHeight * 0.2,
                          child: TabBarView(
                              controller: _tabx.controller,
                              children: [
                                ingGridContainer('good'),
                                ingGridContainer('good'),
                                ingGridContainer('fridged'),
                                ingGridContainer('danger'),
                              ])),
                      Container(
                        margin: EdgeInsets.only(top: displayHeight * 0.03),
                        height: 1,
                        width: displayWidth * 0.8,
                        color: mainColor,
                      ),
                      Container(
                        width: displayWidth * 0.8,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            top: displayHeight * 0.05,
                            bottom: displayHeight * 0.02),
                        child: Text(
                          '가능한 레시피 목록',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight * 0.02),
                        ),
                      ),
                      recipeList()
                    ],
                  ),
                )))));
  }

  condiCon(index, life) {
    if (index < ingResult.length) {
      return Column(children: [
        Stack(
          children: [
            Container(
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
                    'assets/images/icons/ingredient_icon/${ingResult[index]}.png'),
              ),
            ),
            Container(
                height: displayHeight * 0.066,
                color: Colors.transparent,
                alignment: Alignment.bottomRight,
                child: Image(
                    image: AssetImage(
                        'assets/images/icons/expiration_icon/${life}.png')))
          ],
        ),
        Container(
            child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(ingResult[index]),
        ))
      ]);
    }
    return Column(children: [
      Container(
      height: displayHeight * 0.066,
      width: displayWidth * 0.16,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: subColor,
        border: Border.all(color: mainColor, width: 2),
      ),
      child: Icon(
        Icons.add,
        color: mainColor,
      ),
    ),Container(
            child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(' '),
        ))]);
  }

  ingGridContainer(life) {
    return Container(
      width: displayWidth * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
          left: displayWidth * 0.02, right: displayWidth * 0.02),
      padding: EdgeInsets.only(top: displayHeight * 0.01),
      height: displayHeight * 0.2,
      child: GridView.builder(
          itemCount: ingResult.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: displayWidth * 0.02,
              mainAxisExtent: displayHeight * 0.092,
              mainAxisSpacing: displayHeight * 0.02),
          itemBuilder: (BuildContext context, int index) {
            return InkResponse(
              onTap: () {
                if (index < ingResult.length) {
                  print('item selected');
                  {
                    Get.to(() => IngredientModifyPage(),
                        transition: Transition.cupertino);
                  }
                } else if (index == ingResult.length) {
                  print('last item selected');
                  {
                    Get.to(() => IngredientAddPage(),
                        transition: Transition.cupertino);
                  }
                }
              },
              child: condiCon(index, life),
            );
          }),
    );
  }

  availRecipeIcons(ingredients) {
    return Image.asset(
      "assets/images/icons/ingredient_icon/$ingredients.png",
      height: 15,
      width: 15,
    );
  }

  recipeList() {
    return FutureBuilder<Recipes>(
        future: recipeController.recipe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            recipeController.snapshots = snapshot;
            List<String> result = [];
            for (int i = 0; i < 1358; i++) {// 현재 재료를 레시피 데이터와 비교하여 동일한 레시피 찾기
              int count = 0;
              result = snapshot.data!.COOKRCP02.row
                  .elementAt(i)
                  .RCPPARTSDTLS
                  .split(',');
              for (int j = 0; j < result.length; j++) {
                for (int k = 0; k < ingResult.length; k++) {
                  if (result[j].contains(ingResult[k])) {
                    // 추후 every contains로 변경필요
                  count++;
                  }
                }
                if (count == result.length) {
                  recipeController.elementat = i;
                  recipeController.recipeListGenetator();
                //print('this ${snapshot.toString()}');
                }
              }
            }
            return Container(
                width: displayWidth * 0.8,
                height: displayHeight * 0.2,
                child: Obx(()=>ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: recipeController.avaliableRecipe.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: displayWidth * 0.1,
                          height: displayHeight * 0.05,
                          margin: EdgeInsets.only(bottom: displayHeight * 0.01),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: subColor,
                            border: Border.all(color: mainColor, width: 2),
                          ),
                          child: Row(children: [
                            Text(' check${recipeController.avaliableRecipe[index][1].toString()} '),
                            Container(
                                child: Row(children: [
                              availRecipeIcons('김치'),
                              availRecipeIcons('쌀'),
                              availRecipeIcons('양파'),
                              availRecipeIcons('파'),
                              availRecipeIcons('소시지')
                            ])),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Get.to(() => RecipePage(),
                                    transition: Transition.cupertino);
                              },
                              icon: Icon(
                                Icons.arrow_forward_rounded,
                                color: mainColor,
                              ),
                            )
                          ]));
                    })));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
