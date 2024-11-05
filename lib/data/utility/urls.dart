class Urls {
  static const String _baseUrl = "https://ecommerce-api.codesilicon.com/api";
  static const String homeSlider = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';

  static String productListByCategory(int categoryId) => '$_baseUrl/ListProd'
      'uctByCategory/$categoryId';

  static productListByRemark(String remark) => '$_baseUrl/ListProductByRemark/$remark';

  static String productDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';

  static verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static verifyOtp(String email, String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static readProfile() => '$_baseUrl/ReadProfile';


  static String createWishList(int productId) => '$_baseUrl/CreateWishList/$productId';

  static const String getWishList = '$_baseUrl/ProductWishList';
}
