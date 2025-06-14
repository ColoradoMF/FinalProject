import { Routes } from '@angular/router';
import { Home } from './components/home/home';
import { About } from './components/about/about';
import { Contact } from './components/contact/contact';
import { UserProfile } from './components/user-profile/user-profile';
import { SearchResults } from './components/search-results/search-results';
import { Notfound } from './components/notfound/notfound';
import { GasStationDetails } from './components/gas-station-details/gas-station-details';

export const routes: Routes = [
  {path: '', pathMatch: 'full', redirectTo: 'home'},
  {path: 'home', component: Home},
  {path: 'about', component: About},
  {path: 'contact', component: Contact},
  {path: 'profile', component: UserProfile},
  {path: 'search/:zipCode', component: SearchResults},
  {path: 'gasStation/:gasStationId', component: GasStationDetails},
  {path: '**', component: Notfound},

];

