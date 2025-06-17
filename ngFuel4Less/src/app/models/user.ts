import { Address } from "./address";
import { GasStation } from "./gas-station";
import { SavedAddress } from "./saved-address";

export class User {
  id: number ;
  username: string;
  password: string;
  email: String;
  enabled: boolean;
  role: String;
  firstName: String;
  lastName: String;
  imageUrl: String;
  createDate: string | null;
  lastUpdate: string | null;
  savedAddresses: SavedAddress[];
  favoriteGasStations: GasStation[];
  biography: String;


  constructor(
    id: number = 0,
    username: string = '',
    password: string = '',
    email: String = '',
    enabled: boolean = false,
    role: String = '',
    firstName: String = '',
  lastName: String = '',
  imageUrl: String = '',
  createDate: string | null = null,
  lastUpdate: string | null = null,
  savedAddresses: SavedAddress[] = [],
  favoriteGasStations: GasStation[] = [],
    biography: String = '',

  ){
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;
    this.enabled = enabled;
    this.role = role;
    this.firstName = firstName;
    this.lastName = lastName;
    this.imageUrl = imageUrl;
    this.createDate = createDate;
    this.lastUpdate = lastUpdate;
    this.savedAddresses = savedAddresses;
    this.favoriteGasStations = favoriteGasStations;
    this.biography = biography;

  }
}
