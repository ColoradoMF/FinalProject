import { Fueltype } from "./fueltype";

export class PriceReport {
  id: number;
  pricePerGallon: number;
  enabled: boolean;
  createDate: string | null;
  lastUpdate: string | null;
  remarks: String;
  fuelType: Fueltype;


  constructor(
  id: number = 0,
  pricePerGallon: number = 0,
  enabled: boolean = false,
  createDate: string | null = null,
  lastUpdate: string | null = null,
  remarks: String = '',
  fuelType: Fueltype = new Fueltype(),

  ){
    this.id = id;
    this.pricePerGallon = pricePerGallon;
    this.enabled = enabled;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
    this.remarks = remarks;
    this.fuelType = fuelType;
  }

}
