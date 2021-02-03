import 'dart:convert';

class Employee{
  final int id;
  final String name;
  final String email;
  Address address;
  Employee({this.id,this.name,this.email,this.address});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['username'],
      email: json['email'],
      address: json['address']!=null?new Address.fromJson(json['address']):null
    );
  }
}

class Address{
  final String city;
  final String street;

  Address({this.city, this.street});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
     street: json['street'],
    );
  }
}
