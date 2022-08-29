class AllCases
{

  dynamic cases ;
  dynamic deaths ;
  dynamic todayDeaths;
  dynamic recovered;
  dynamic todayRecovered;
  dynamic active ;
  dynamic critical ;
  AllCases.fromJson(Map<String,dynamic>json){
    cases =json['cases'];
    deaths =json['deaths'];
    recovered =json['recovered'];
    active =json['active'];
    critical =json['critical'];
    todayDeaths =json['todayDeaths'];
    todayRecovered =json['todayRecovered'];
}
}