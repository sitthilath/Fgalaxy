class PaymentHistory {
  final int? id;
  final String? orderNumber;
  final int? totalAmount;
  final String? winTotalAmount;
  final bool? isWin;
  final String? drawId;
  final String? lotteryType;
  final User? user;
  final List<Payment>? payments;
  final List<LotteryUserOrderDetail>? lotteryUserOrderDetails;
  final DateTime? createdAt;


  PaymentHistory({
    this.id,
    this.orderNumber,
    this.totalAmount,
    this.winTotalAmount,
    this.isWin,
    this.drawId,
    this.lotteryType,
    this.user,
    this.payments,
    this.lotteryUserOrderDetails,
    this.createdAt,
  });

  PaymentHistory copyWith({
    int? id,
    String? orderNumber,
    int? totalAmount,
    String? winTotalAmount,
    bool? isWin,
    String? drawId,
    String? lotteryType,
    User? user,
    List<Payment>? payments,
    List<LotteryUserOrderDetail>? lotteryUserOrderDetails,
    DateTime? createdAt,
  }) =>
      PaymentHistory(
        id: id ?? this.id,
        orderNumber: orderNumber ?? this.orderNumber,
        totalAmount: totalAmount ?? this.totalAmount,
        winTotalAmount: winTotalAmount ?? this.winTotalAmount,
        isWin: isWin ?? this.isWin,
        drawId: drawId ?? this.drawId,
        lotteryType: lotteryType ?? this.lotteryType,
        user: user ?? this.user,
        payments: payments ?? this.payments,
        lotteryUserOrderDetails: lotteryUserOrderDetails ?? this.lotteryUserOrderDetails,
        createdAt: createdAt ?? this.createdAt,
      );


  factory PaymentHistory.fromJson(Map<String, dynamic> json){
    return PaymentHistory(
      id: json["id"],
      orderNumber: json["order_number"],
      totalAmount: int.tryParse(json["total_amount"]),
      winTotalAmount: json["win_total_amount"],
      isWin: json["is_win"],
      drawId: json["draw_id"],
      lotteryType: json["lottery_type"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
      lotteryUserOrderDetails: json["lottery_user_order_details"] == null ? [] : List<LotteryUserOrderDetail>.from(json["lottery_user_order_details"]!.map((x) => LotteryUserOrderDetail.fromJson(x))),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

}

class LotteryUserOrderDetail {
  final String? id;
  final int? amount;
  final String? digit;
  final String? winAmount;
  final bool? isActive;
  final String? destinationAmount;
  final String? refundAmount;


  LotteryUserOrderDetail({
    this.id,
    this.amount,
    this.digit,
    this.winAmount,
    this.isActive,
    this.destinationAmount,
    this.refundAmount,
  });

  factory LotteryUserOrderDetail.fromJson(Map<String, dynamic> json){
    return LotteryUserOrderDetail(
      id: json["id"],
      amount: int.tryParse(json["amount"]),
      digit: json["digit"],
      winAmount: json["win_amount"],
      isActive: json["is_active"],
      destinationAmount: json["destination_amount"],
      refundAmount: json["refund_amount"],
    );
  }

}

class Payment {
  final String? id;
  final String? orderId;
  final String? orderType;
  final dynamic merchantId;
  final User? createdBy;
  final String? status;
  final dynamic succcessAt;
  final dynamic cancelledAt;
  final String? totalAmount;
  final String? subTotalAmount;
  final PaymentType? paymentType;
  final List<PaymentDetail>? paymentDetails;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  Payment({
    this.id,
    this.orderId,
    this.orderType,
    this.merchantId,
    this.createdBy,
    this.status,
    this.succcessAt,
    this.cancelledAt,
    this.totalAmount,
    this.subTotalAmount,
    this.paymentType,
    this.paymentDetails,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Payment copyWith({
    String? id,
    String? orderId,
    String? orderType,
    dynamic merchantId,
    User? createdBy,
    String? status,
    dynamic succcessAt,
    dynamic cancelledAt,
    String? totalAmount,
    String? subTotalAmount,
    PaymentType? paymentType,
    List<PaymentDetail>? paymentDetails,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      Payment(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        orderType: orderType ?? this.orderType,
        merchantId: merchantId ?? this.merchantId,
        createdBy: createdBy ?? this.createdBy,
        status: status ?? this.status,
        succcessAt: succcessAt ?? this.succcessAt,
        cancelledAt: cancelledAt ?? this.cancelledAt,
        totalAmount: totalAmount ?? this.totalAmount,
        subTotalAmount: subTotalAmount ?? this.subTotalAmount,
        paymentType: paymentType ?? this.paymentType,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory Payment.fromJson(Map<String, dynamic> json){
    return Payment(
      id: json["id"],
      orderId: json["order_id"],
      orderType: json["order_type"],
      merchantId: json["merchant_id"],
      createdBy: json["created_by"] == null ? null : User.fromJson(json["created_by"]),
      status: json["status"],
      succcessAt: json["succcess_at"],
      cancelledAt: json["cancelled_at"],
      totalAmount: json["total_amount"],
      subTotalAmount: json["sub_total_amount"],
      paymentType: json["paymentType"] == null ? null : PaymentType.fromJson(json["paymentType"]),
      paymentDetails: json["paymentDetails"] == null ? [] : List<PaymentDetail>.from(json["paymentDetails"]!.map((x) => PaymentDetail.fromJson(x))),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
    );
  }

}

class User {
  final int? id;
  final String? username;
  final String? email;
  final dynamic phone;
  final DateTime? verifyAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.verifyAt,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    dynamic phone,
    DateTime? verifyAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        verifyAt: verifyAt ?? this.verifyAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      verifyAt: DateTime.tryParse(json["verify_at"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class PaymentDetail {
  final String? id;
  final dynamic billNumber;
  final dynamic phoneNumber;
  final dynamic storeLabel;
  final dynamic referenceLabel;
  final dynamic terminalLabel;
  final dynamic purposeOfTransaction;
  final dynamic currency;
  final dynamic country;
  final dynamic merchantAccountApplicationId;
  final String? originAmount;
  final String? destinationAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  PaymentDetail({
    this.id,
    this.billNumber,
    this.phoneNumber,
    this.storeLabel,
    this.referenceLabel,
    this.terminalLabel,
    this.purposeOfTransaction,
    this.currency,
    this.country,
    this.merchantAccountApplicationId,
    this.originAmount,
    this.destinationAmount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  PaymentDetail copyWith({
    String? id,
    dynamic billNumber,
    dynamic phoneNumber,
    dynamic storeLabel,
    dynamic referenceLabel,
    dynamic terminalLabel,
    dynamic purposeOfTransaction,
    dynamic currency,
    dynamic country,
    dynamic merchantAccountApplicationId,
    String? originAmount,
    String? destinationAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      PaymentDetail(
        id: id ?? this.id,
        billNumber: billNumber ?? this.billNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        storeLabel: storeLabel ?? this.storeLabel,
        referenceLabel: referenceLabel ?? this.referenceLabel,
        terminalLabel: terminalLabel ?? this.terminalLabel,
        purposeOfTransaction: purposeOfTransaction ?? this.purposeOfTransaction,
        currency: currency ?? this.currency,
        country: country ?? this.country,
        merchantAccountApplicationId: merchantAccountApplicationId ?? this.merchantAccountApplicationId,
        originAmount: originAmount ?? this.originAmount,
        destinationAmount: destinationAmount ?? this.destinationAmount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory PaymentDetail.fromJson(Map<String, dynamic> json){
    return PaymentDetail(
      id: json["id"],
      billNumber: json["bill_number"],
      phoneNumber: json["phone_number"],
      storeLabel: json["store_label"],
      referenceLabel: json["reference_label"],
      terminalLabel: json["terminal_label"],
      purposeOfTransaction: json["purpose_of_transaction"],
      currency: json["currency"],
      country: json["country"],
      merchantAccountApplicationId: json["merchant_account_application_id"],
      originAmount: json["origin_amount"],
      destinationAmount: json["destination_amount"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
    );
  }

}

class PaymentType {
  final int? id;
  final String? name;
  final bool? isActive;
  final dynamic imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentType({
    this.id,
    this.name,
    this.isActive,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  PaymentType copyWith({
    int? id,
    String? name,
    bool? isActive,
    dynamic imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PaymentType(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        imageUrl: imageUrl ?? this.imageUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PaymentType.fromJson(Map<String, dynamic> json){
    return PaymentType(
      id: json["id"],
      name: json["name"],
      isActive: json["is_active"],
      imageUrl: json["image_url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}





