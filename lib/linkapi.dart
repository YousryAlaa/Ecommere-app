class LinkApi {
  static const String servername = 'http://192.168.1.14:8080/ecommerce';
  static const String testdata = '$servername/test.php';

  // ----------------------Image  -------------------//
  static const String imagestatic = '$servername/upload';
  static const String imagecategories = '$imagestatic/categories';
  static const String imageitems = '$imagestatic/items';

  // -------------------------Auth----------------------------//
  static const String signup = '$servername/auth/signup.php';
  static const String login = '$servername/auth/login.php';
  static const String verifycodesignup = '$servername/auth/verifycode.php';
  static const String forgetpassword =
      '$servername/forgetpassword/checkemail.php';
  static const String verifycode = '$servername/forgetpassword/verifycode.php';
  static const String resetpassword =
      '$servername/forgetpassword/resetpassword.php';
  static const String resendcode = '$servername/auth/resendverifycode.php';

  // ----------------------Home ----------------------//
  static const String home = "$servername/home.php";
  // ------------------ Items -----------------//
  static const String items = "$servername/items/items.php";
  static const String addfavorite = "$servername/items/addfavoriteitems.php";
  static const String searchitems = "$servername/items/search.php";
  static const String deletefavorite =
      "$servername/items/deletefavoriteitems.php";
  static const String myfavorite = "$servername/items/viewfavorite.php";
  static const String deletefrommyfavorite =
      "$servername/items/deletefrommyfavorite.php";
  // ------------------ Carts ----------------- //
  static const String addcart = "$servername/items/addcart.php";
  static const String mycart = "$servername/items/viewcarts.php";
  static const String deletecart = "$servername/items/deletecart.php";
  static const String getitemscount = "$servername/items/getitemscartcount.php";
  // ------------------ Address ----------------- //
  static const String addaddress = "$servername/address/add.php";
  static const String viewaddress = "$servername/address/view.php";
  static const String editaddress = "$servername/address/edit.php";
  static const String deleteaddress = "$servername/address/delete.php";

  // ------------------ Coupon ----------------- //
  static const String checkcoupon = "$servername/coupon/checkcoupon.php";
  // ------------------ Checkout ----------------- //
  static const String checkout = "$servername/orders/checkout.php";
  static const String orders = "$servername/orders/order.php";
  static const String orderdetails = "$servername/orders/details.php";
  static const String orderdelete = "$servername/orders/delete.php";
  static const String archiveorder = "$servername/orders/archive.php";

  //---------------------------Notification -----------------------
  static const String notification = "$servername/notification.php";

  //---------------------------Offers -----------------------
  static const String offers = "$servername/offers.php";
  //---------------------------Rating Orders -----------------------
  static const String rating = "$servername/rating.php";
  //---------------------------Rating  -----------------------
  static const String addrating = "$servername/rating/add.php";
}
