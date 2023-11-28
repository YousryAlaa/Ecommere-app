import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/midlleware/mymidlleware.dart';
import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/screen/address/add.dart';
import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/sucessresetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/successsignup.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/checkout/checkout.dart';
import 'package:ecommerce/view/screen/home/home.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:ecommerce/view/screen/home/itemsscreen.dart';
import 'package:ecommerce/view/screen/home/myfavorite.dart';
import 'package:ecommerce/view/screen/home/settings.dart';
import 'package:ecommerce/view/screen/home/shoppingcart.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/archive.dart';
import 'package:ecommerce/view/screen/orders/orderdetails.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:ecommerce/view/test_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMidlleware()]),

  // -----------Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetpass, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.successsignup, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoutes.verifycodesignup, page: () => const VerifyCodeSignUp()),

  // ------------Home
  GetPage(name: AppRoutes.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.myfavorite, page: () => const MyFovrite()),
  GetPage(name: AppRoutes.shoppingcart, page: () => const ShoppingCart()),
  GetPage(name: AppRoutes.settings, page: () => const Settings()),

  //------------------ address
  GetPage(name: AppRoutes.viewaddress, page: () => const ViewAddress()),
  GetPage(name: AppRoutes.addaddress, page: () => const AddAddress()),
  //------------------ check out

  GetPage(name: AppRoutes.checkout, page: () => const CheckOut()),
  //------------------- orders
  GetPage(name: AppRoutes.pendingorder, page: () => const PendingOrders()),
  GetPage(name: AppRoutes.archiveorder, page: () => const ArchiveOrders()),
  GetPage(name: AppRoutes.notification, page: () => const NotifictionView()),
  GetPage(name: AppRoutes.orderdetails, page: () => const OrderDetails()),
];
