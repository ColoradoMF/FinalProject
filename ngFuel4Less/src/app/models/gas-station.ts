import { Address } from "./address";
import { PriceReport } from "./price-report";
import { User } from "./user";

export class GasStation {
  id: number;
  name: String;
  imageUrl: String;
  createdDate: string | null;
  updateDate: string | null;
  remarks: String;
  // users: User[];
  address: Address;
  priceReports: PriceReport[];

  constructor(
    id: number = 0,
  name: String = '',
  imageUrl: String = '',
  createdDate: string | null = null,
  updateDate: string | null = null,
  remarks: String = '',
  // users: User[] = [],
  address: Address = new Address(),
  priceReports: PriceReport[] = []
  ){
    this.id = id;
    this.name = name;
    this.imageUrl = imageUrl;
    this.createdDate = createdDate;
    this.updateDate = updateDate;
    this.remarks = remarks;
    // this.users = users;
    this.address = address;
    this.priceReports = priceReports;
  }
}
