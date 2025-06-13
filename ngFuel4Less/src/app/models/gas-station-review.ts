export class GasStationReview {
  id: number;
  rating: number;
  comment: String;
  createDate: string | null;
  lastUpdate: string | null;


  constructor(
    id: number = 0,
  rating: number = 0,
  comment: String = '',
  createDate: string | null = null,
  lastUpdate: string | null = null,
  ){
    this.id = id;
    this.rating = rating;
    this.comment = comment;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
  }
}
