export class User {
  id: number ;
  username: string;
  password: string;
  email: String;
  enabled: boolean;
  role: String;

  constructor(
    id: number = 0,
    username: string = '',
    password: string = '',
    email: String = '',
    enabled: boolean = false,
    role: String = ''
  ){
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;
    this.enabled = enabled;
    this.role = role;

  }
}
