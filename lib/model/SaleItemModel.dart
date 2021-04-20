class SaleItemModel {
  String itemName;
  int itemId;
  int productId;
  String itemPrice;
  int itemQuantity;
  int shopId;
  String shopName;

  SaleItemModel({this.itemName, this.itemPrice, this.itemQuantity,this.shopId,this.shopName,this.productId});

  SaleItemModel.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    itemId = json['item_id'];
    productId = json['product_id'];
    itemPrice = json['price'];
    itemQuantity = json['quantity'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_id'] = this.itemId;
    data['product_id'] = this.productId;
    data['price'] = this.itemPrice;
    data['quantity'] = this.itemQuantity;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    return data;
  }

  static List<SaleItemModel> fromData(List<dynamic> data){
    return data.map((channelData) => SaleItemModel.fromJson(channelData)).toList();
  }
}
