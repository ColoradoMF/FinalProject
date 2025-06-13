export class Fueltype {
  id: number;
  name: String;
  imageUrl: String;

  constructor(
    id: number = 0,
  name: String ='' ,
  imageUrl: String = '',
  ){

    this.id = id;
    this.name = name;
    this.imageUrl = imageUrl;
  }
}
