export class Address {
  id: number;
  street: String;
  street2: String;
  city: String;
  state: String;
  zipCode: string;

  constructor(
    id: number = 0,
  street: String = '',
  street2: String = '',
  city: String = '',
  state: String = '',
  zipCode: string = '',
  ){
    this.id = id;
    this.street = street;
    this.street2 = street2;
    this.city = city;
    this.state = state;
    this.zipCode = zipCode;
  }
}
