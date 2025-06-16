import { Fueltype } from "./fueltype";
import { GasStation } from "./gas-station";
import { User } from "./user";

export class PriceReport {
  id: number;
  pricePerGallon: number;
  enabled: boolean;
  createDate: string | null | undefined;
  lastUpdate: string | null | undefined;
  remarks: String;
  fuelType: Fueltype;
  gasStation: GasStation;
  user: User;
  reportVotes: any;


  constructor(
  id: number = 0,
  pricePerGallon: number = 0,
  enabled: boolean = false,
  createDate: string | null = null,
  lastUpdate: string | null = null,
  remarks: String = '',
  fuelType: Fueltype = new Fueltype(),
  gasStation: GasStation = new GasStation(),
  user:User = new User()


  ){
    this.id = id;
    this.pricePerGallon = pricePerGallon;
    this.enabled = enabled;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
    this.remarks = remarks;
    this.fuelType = fuelType;
    this.gasStation = gasStation;
    this.user = user;
  }

}
