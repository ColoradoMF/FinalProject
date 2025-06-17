import { User } from "./user";

export class SavedAddressId {
  userId: number;
  addressId: number;

  constructor(
    userId: number = 0,
    addressId: number = 0,
  ){
    this.userId = userId;
    this.addressId = addressId;
  }
}
