class ConfigResponse{
  late String ipAddress;
  //late String org;
  //late String region;
  //late String country;

  ConfigResponse({required String ipAddress, /*required String org, required String region, required String country*/}){
    ipAddress = ipAddress;
    //org = org;
    //region = region;
    //country = country;
  }
  ConfigResponse.fromJson(dynamic json){
    ipAddress = json['ip'];
    //org = json['asn_org'];
    //region = json['region_name'];
    //country = json['country'];
  }
}
// class ConfigResponse{
//   final String ipAddress;
//   //final String org;
//   //final String region;
//   //final String country;

//   ConfigResponse(this.ipAddress);
//   // ConfigResponse.fromJson(dynamic json){
//   //   ipAddress = json['ip'];
//   //   //org = json['asn_org'];
//   //   //region = json['region_name'];
//   //   //country = json['country'];
//   // }
// }