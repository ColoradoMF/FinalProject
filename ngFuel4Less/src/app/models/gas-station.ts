import { User } from "./user";

export class GasStation {
  id: number;
  name: String;
  imageUrl: String;
  createdDate: string | null;
  updateDate: string | null;
  remarks: String;
  users: User[];

  constructor(
    id: number = 0,
  name: String = '',
  imageUrl: String = '',
  createdDate: string | null = null,
  updateDate: string | null = null,
  remarks: String = '',
  users: User[] = [],
  ){
    this.id = id;
    this.name = name;
    this.imageUrl = imageUrl;
    this.createdDate = createdDate;
    this.updateDate = updateDate;
    this.remarks = remarks;
    this.users = users;
  }
}
