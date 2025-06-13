import { GasStation } from "./gas-station";
import { User } from "./user";

export class GasStationReview {
  id: number;
  rating: number;
  comment: String;
  createDate: string | null;
  lastUpdate: string | null;
  user: User;
  gasStation: GasStation;


  constructor(
    id: number = 0,
  rating: number = 0,
  comment: String = '',
  createDate: string | null = null,
  lastUpdate: string | null = null,
  user: User = new User(),
  gasStation: GasStation = new GasStation(),
  ){
    this.id = id;
    this.rating = rating;
    this.comment = comment;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
    this.user = user;
    this.gasStation = gasStation;
  }
}
