class ReviewCartModel{
   String cartId;
  String cartImage;
   String cartName;
 int cartPrice;
   int cartQuantity;
  ReviewCartModel({
    required this.cartName,
     required this.cartImage,
   required this.cartPrice,
     required this.cartQuantity,
     required this.cartId});
}