export class PriceReport {
  id: number;
  pricePerGallon: number;
  enabled: boolean;
  createDate: string | null;
  lastUpdate: string | null;
  remarks: String;


  constructor(
  id: number = 0,
  pricePerGallon: number = 0,
  enabled: boolean = false,
  createDate: string | null = null,
  lastUpdate: string | null = null,
  remarks: String = '',
  ){
    this.id = id;
    this.pricePerGallon = pricePerGallon;
    this.enabled = enabled;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
    this.remarks = remarks;
  }

}
