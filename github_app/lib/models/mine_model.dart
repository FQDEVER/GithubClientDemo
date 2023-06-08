class MineModel {
  List<Cars>? cars;
  String? userType;
  String? charger;
  String? token;

  MineModel({this.cars, this.userType, this.charger, this.token});

  MineModel.fromJson(Map<String, dynamic> json) {
    if (json['cars'] != null) {
      cars = <Cars>[];
      json['cars'].forEach((v) {
        cars!.add(Cars.fromJson(v));
      });
    }
    userType = json['userType'];
    charger = json['charger'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cars != null) {
      data['cars'] = cars!.map((v) => v.toJson()).toList();
    }
    data['userType'] = userType;
    data['charger'] = charger;
    data['token'] = token;
    return data;
  }
}

class Cars {
  int? recordId;
  int? userId;
  String? nickName;
  int? batteryCapacity;
  int? drivingRang;
  String? chargingRate;
  String? icon;

  Cars(
      {this.recordId,
      this.userId,
      this.nickName,
      this.batteryCapacity,
      this.drivingRang,
      this.chargingRate,
      this.icon});

  Cars.fromJson(Map<String, dynamic> json) {
    recordId = json['recordId'];
    userId = json['userId'];
    nickName = json['nickName'];
    batteryCapacity = json['batteryCapacity'];
    drivingRang = json['drivingRang'];
    chargingRate = json['chargingRate'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recordId'] = recordId;
    data['userId'] = userId;
    data['nickName'] = nickName;
    data['batteryCapacity'] = batteryCapacity;
    data['drivingRang'] = drivingRang;
    data['chargingRate'] = chargingRate;
    data['icon'] = icon;
    return data;
  }
}
