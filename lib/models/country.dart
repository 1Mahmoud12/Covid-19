class Country
{

  dynamic country ;
  dynamic cases ;
  dynamic deaths ;
  dynamic todayDeaths;
  dynamic recovered;
  dynamic todayRecovered;
  dynamic active ;
  dynamic critical ;
  Image? info ;
  Country.fromJson(Map<String,dynamic>json){

    country =json['country'];
    cases =json['cases'];
    deaths =json['deaths'];
    recovered =json['recovered'];
    active =json['active'];
    critical =json['critical'];
    todayDeaths =json['todayDeaths'];
    todayRecovered =json['todayRecovered'];
    info=Image.fromJson(json['countryInfo']);
  }
}

class Image
{
String? flag;
Image.fromJson(Map<String,dynamic>json){
  flag=json['flag'];
}
}