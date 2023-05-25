class ReviewCartModel{
  late String cartId;
  late String cartImage;
  late String cartName;
  late int cartPrice;
  late int cartQuantity;
  ReviewCartModel({required this.cartName,
    required this.cartImage,required this.cartPrice,required this.cartQuantity,
    required this.cartId});
}