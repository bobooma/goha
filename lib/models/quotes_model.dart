class QuoteModel {
  // final String conculosion;
  final String imgUrl;
  final String quoteDetail;

  QuoteModel({
    required this.imgUrl,
    required this.quoteDetail,
  });

  factory QuoteModel.fromRTDB(Map<String, dynamic> data) {
    return QuoteModel(
        quoteDetail: data["details"] ?? "..", imgUrl: data["imgUrl"] ?? "...");
  }
}
