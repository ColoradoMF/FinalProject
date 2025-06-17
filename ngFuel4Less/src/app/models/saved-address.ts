import { Address } from "./address";
import { SavedAddressId } from "./saved-address-id";
import { User } from "./user";

export class SavedAddress {
  id: SavedAddressId;
  enabled: boolean;
  name: String;
  createDate: string | null;
  lastUpdate: string | null;
  user: User;
  address: Address;

  constructor(
    id: SavedAddressId = new SavedAddressId(0, 0),
  enabled: boolean = false,
  name: String = '',
  createDate: string | null = null,
  lastUpdate: string | null = null,
  user: User = new User(),
  address: Address = new Address(),
  ){
    this.id = id;
    this.enabled = enabled;
    this.name = name;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
    this.user = user;
    this.address = address;
  }
}
