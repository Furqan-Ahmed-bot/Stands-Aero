String globaltoken = "";
String userid = "";
dynamic currecntuid;
var is_kyc;
var requestFormdatafromQuote;
var kycrequestFormdatafromQuote;
var creditfirstFormData;
var placeOrderData;
var placeOrderData_tax_file;
var placeOrderData_quote_id;
var placeOrderData_fileType;
var global_day;
var global_month;
var global_customer_name;
var global_customer_location;
var global_stand_manufacturer;
var global_stand_color;
var global_stand_type;
var global_stand_serial_number;
var global_stand_quantity;
var global_delivery_location;
var global_delivery_date;
var global_daily_rent;
var global_replacement_value;
var global_security_deposit;
var global_guarantor;
var global_registered_agent;
var global_signature_1;
var global_signature_2;
var signature;
var signaturetype;
var webtoken;

final globalHeaders1 = {
  'Accept': 'application/json',
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': 'Bearer ${globaltoken}',
};

final globalHeaders = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ${globaltoken}',
};
