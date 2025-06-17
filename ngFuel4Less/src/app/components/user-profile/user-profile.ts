import { SavedAddressService } from './../../services/saved-address-service';
import { Component } from '@angular/core';
import { User } from '../../models/user';
import { ActivatedRoute, Router } from '@angular/router';
import { UserService } from '../../services/user-service';
import { AuthService } from '../../services/auth-service';
import { FormsModule } from '@angular/forms';
import { SavedAddress } from '../../models/saved-address';

@Component({
  selector: 'app-user-profile',
  imports: [FormsModule, ],
  templateUrl: './user-profile.html',
  styleUrl: './user-profile.css'
})
export class UserProfile {

  user: User = new User();
  newSavedAddress: SavedAddress = new SavedAddress();



  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private userService: UserService,
    private auth: AuthService,
    private savedAddressService: SavedAddressService,
  ){}

  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe({
      next: (params) => {
        let userIdStr = params.get("userId");
        if(userIdStr) {
          let userId = Number.parseInt(userIdStr);
          if(isNaN(userId)){
            this.router.navigateByUrl("notFound");
          }else {
            this.displayDetails(userId);
          }
        } else {
          this.getLoggedInUser();
        }

      }
    })
  }

  getLoggedInUser() {
   this.auth.getLoggedInUser().subscribe({
      next: (user) => {
       this.user = user;

      }
    });

  }

  submitForm(newSavedAddress: SavedAddress) {
     console.log('Submitting:', this.newSavedAddress);
        this.savedAddressService.create(newSavedAddress).subscribe({
          next: (response) => {
            console.log('Success:', response);
            this.newSavedAddress = new SavedAddress();
            if (this.auth.checkLogin()) {
              this.getLoggedInUser()
            } else {
              this.displayDetails(this.user.id);
            }
          },
          error: (err) => {
            console.error('Error submitting:', err);
          }
        });
}

  displayDetails(userId: number): void{
    this.userService.show(userId).subscribe({
      next: (user) => {
         this.user = user;
        },
        error: (err) => {
          console.error(err);
          console.error("User.ts Component: Error loading User")
          this.router.navigateByUrl("UserNotFound")
        }
      })
    }

}
