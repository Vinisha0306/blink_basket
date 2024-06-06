class Product {
  String productId;
  String productTitle;
  String productDescription;
  List<String> productPhotos;
  ProductAttributes productAttributes;
  double productRating;
  String productPageUrl;
  String productOffersPageUrl;
  String productSpecsPageUrl;
  String productReviewsPageUrl;
  int productNumReviews;
  String productNumOffers;
  List<String> typicalPriceRange;
  Offer offer;

  Product({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPhotos,
    required this.productAttributes,
    required this.productRating,
    required this.productPageUrl,
    required this.productOffersPageUrl,
    required this.productSpecsPageUrl,
    required this.productReviewsPageUrl,
    required this.productNumReviews,
    required this.productNumOffers,
    required this.typicalPriceRange,
    required this.offer,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productTitle: json["product_title"],
        productDescription: json["product_description"],
        productPhotos: List<String>.from(json["product_photos"].map((x) => x)),
        productAttributes:
            ProductAttributes.fromJson(json["product_attributes"]),
        productRating: json["product_rating"]?.toDouble(),
        productPageUrl: json["product_page_url"],
        productOffersPageUrl: json["product_offers_page_url"],
        productSpecsPageUrl: json["product_specs_page_url"],
        productReviewsPageUrl: json["product_reviews_page_url"],
        productNumReviews: json["product_num_reviews"],
        productNumOffers: json["product_num_offers"],
        typicalPriceRange:
            List<String>.from(json["typical_price_range"].map((x) => x)),
        offer: Offer.fromJson(json["offer"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_title": productTitle,
        "product_description": productDescription,
        "product_photos": List<dynamic>.from(productPhotos.map((x) => x)),
        "product_attributes": productAttributes.toJson(),
        "product_rating": productRating,
        "product_page_url": productPageUrl,
        "product_offers_page_url": productOffersPageUrl,
        "product_specs_page_url": productSpecsPageUrl,
        "product_reviews_page_url": productReviewsPageUrl,
        "product_num_reviews": productNumReviews,
        "product_num_offers": productNumOffers,
        "typical_price_range":
            List<dynamic>.from(typicalPriceRange.map((x) => x)),
        "offer": offer.toJson(),
      };
}

class Offer {
  String storeName;
  double storeRating;
  String offerPageUrl;
  int storeReviewCount;
  String storeReviewsPageUrl;
  String price;
  String shipping;
  String tax;
  bool onSale;
  dynamic originalPrice;
  String productCondition;
  bool topQualityStore;

  Offer({
    required this.storeName,
    required this.storeRating,
    required this.offerPageUrl,
    required this.storeReviewCount,
    required this.storeReviewsPageUrl,
    required this.price,
    required this.shipping,
    required this.tax,
    required this.onSale,
    required this.originalPrice,
    required this.productCondition,
    required this.topQualityStore,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        storeName: json["store_name"],
        storeRating: json["store_rating"]?.toDouble(),
        offerPageUrl: json["offer_page_url"],
        storeReviewCount: json["store_review_count"],
        storeReviewsPageUrl: json["store_reviews_page_url"],
        price: json["price"],
        shipping: json["shipping"],
        tax: json["tax"],
        onSale: json["on_sale"],
        originalPrice: json["original_price"],
        productCondition: json["product_condition"],
        topQualityStore: json["top_quality_store"],
      );

  Map<String, dynamic> toJson() => {
        "store_name": storeName,
        "store_rating": storeRating,
        "offer_page_url": offerPageUrl,
        "store_review_count": storeReviewCount,
        "store_reviews_page_url": storeReviewsPageUrl,
        "price": price,
        "shipping": shipping,
        "tax": tax,
        "on_sale": onSale,
        "original_price": originalPrice,
        "product_condition": productCondition,
        "top_quality_store": topQualityStore,
      };
}

class ProductAttributes {
  String department;
  String size;
  String material;
  String color;
  String features;

  ProductAttributes({
    required this.department,
    required this.size,
    required this.material,
    required this.color,
    required this.features,
  });

  factory ProductAttributes.fromJson(Map<String, dynamic> json) =>
      ProductAttributes(
        department: json["Department"],
        size: json["Size"],
        material: json["Material"],
        color: json["Color"],
        features: json["Features"],
      );

  Map<String, dynamic> toJson() => {
        "Department": department,
        "Size": size,
        "Material": material,
        "Color": color,
        "Features": features,
      };
}
