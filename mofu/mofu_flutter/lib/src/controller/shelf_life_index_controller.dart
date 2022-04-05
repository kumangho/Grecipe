import 'package:get/get.dart';

class ShelfLifeIndexController extends GetxController {

  RxList<bool> isSelected = [false, true, false].obs;
  void changeTabIndex(int index) {
  RxInt tabIndex = 0.obs;
    tabIndex.value = index;
          for(int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
            if(buttonIndex == index){
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
