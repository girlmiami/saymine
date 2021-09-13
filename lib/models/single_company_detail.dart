class SingleCompanyDetails {
  String? usage;
  DateTime? joinedDate;
  String? companyName;
  String? industry;
  bool? isNewFootprint;
  bool? dataClaimed;
  var typeOfDataShared;

  SingleCompanyDetails({
    this.usage,
    this.joinedDate,
    this.companyName,
    this.industry,
    this.isNewFootprint,
    this.dataClaimed,
    this.typeOfDataShared,
  });

  SingleCompanyDetails.fromJson(Map<String, dynamic> json) {
    usage = json['usage'];
    joinedDate = json['joinedDate'].toDate();
    companyName = json['companyName'];
    industry = json['industry'];
    isNewFootprint = json['isNewFootprint'];
    dataClaimed = json['dataClaimed'];
    typeOfDataShared = json['typeOfDataShared'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usage'] = this.usage;
    data['joinedDate'] = this.joinedDate;
    data['companyName'] = this.companyName;
    data['industry'] = this.industry;
    data['isNewFootprint'] = this.isNewFootprint;
    data['dataClaimed'] = this.dataClaimed;
    data['typeOfDataShared'] = this.typeOfDataShared;
    return data;
  }
}
