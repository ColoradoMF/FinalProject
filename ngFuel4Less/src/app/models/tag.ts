export class Tag {
  id: number;
  name: String;
  description: String;
  imageUrl: String;

  constructor(
     id: number = 0,
  name: String = '',
  description: String = '',
  imageUrl: String = '',
  ){
    this.id = id;
    this.name = name;
    this.description = description;
    this.imageUrl = imageUrl;
  }

}
