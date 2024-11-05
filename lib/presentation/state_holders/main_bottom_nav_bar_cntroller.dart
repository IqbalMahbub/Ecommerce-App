import 'package:ecommerceapp/presentation/screens/email_varificationScreen.dart';
import 'package:ecommerceapp/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController{
    int _selectedIndex=0;
    int get selectedIndex=>_selectedIndex;

    Future<void>changeIndex(int index)async{
        if(index==2||index==3){
          final isLogedIn=await UserAuthController.checkLoggedInState();
          if(!isLogedIn){
            Get.to(()=>const EmailVarificationScreen());
            return;
          }
        }

      _selectedIndex=index;
      update();
    }

    void backToHome(){
      changeIndex(0);
    }
void selectCategory(){
      changeIndex(1);
}

}
