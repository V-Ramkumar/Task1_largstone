

class MarketModel {
  int? id;
  String? leadId;
  String? customerName;
  String?managedBy;
  String? customerType;
  String?date;
  MarketModel(
      {this.id,
        this.leadId,
        this.customerName,
        this.managedBy,
        this.customerType,
        this.date,
       });

  MarketModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        leadId = res["lead_id"],
        customerName=res["customer_name"],
        managedBy = res["managed_by"],
        customerType = res["customer_type"],date = res["date"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'lead_id':leadId,
      'customer_name':customerName,
      'managed_by': managedBy,
      'customer_type': customerType,
      'date':date
    };
  }


}
