class CompleteProfileModel {

  final String cusName;
  final String cusAdd;
  final String cusCity;
  final String cusState;
  final String cusPostcode;
  final String cusCountry;
  final String cusPhone;
  final String cusFax;
  final String shipName;
  final String shipAdd;
  final String shipCity;
  final String shipState;
  final String shipPostcode;
  final String shipCountry;
  final String shipPhone;
  final String created_at;
  final String updated_at;
  final int user_id;
  final int id;



  CompleteProfileModel(
      {
        required this.cusName,
        required this.cusAdd,
        required this.cusCity,
         this.cusState='',
         this.cusPostcode='',
         this.cusCountry='',
        required this.cusPhone,
           this.cusFax='',
           this.shipName='',
        this.shipAdd='',
          this.shipCity='',
          this.shipState='',
         this.shipPostcode='',
          this.shipCountry='',
         this.shipPhone='',
        required this.created_at,
       required this.updated_at,
       required  this.user_id,
        this.id=0
      });

  Map<String, dynamic> toJson() {
    return {
      'user_id':user_id,
      'cus_name': cusName ?? '',
      'cus_add': cusAdd,
      'cus_city': cusCity,
      'cus_state': cusState,
      'cus_postcode': cusPostcode,
      'cus_country': cusCountry,
      'cus_phone': cusPhone,
      'cus_fax': cusFax,
      'ship_name': shipName,
      'ship_add': shipAdd,
      'ship_city': shipCity,
      'ship_state': shipState,
      'ship_postcode': shipPostcode,
      'ship_country': shipCountry,
      'ship_phone': shipPhone,
      'updated_at':updated_at,
      'created_at':created_at,
      'id': id

    };
  }
}
