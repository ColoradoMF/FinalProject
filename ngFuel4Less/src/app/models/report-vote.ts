import { provideCheckNoChangesConfig } from "@angular/core";
import { PriceReport } from "./price-report";
import { User } from "./user";

export class ReportVote {
  id: number;
 vote: boolean;
 createDate: string | null;
 lastUpdate: string | null;
 user: User;
 priceReport: PriceReport;

 constructor(
    id: number = 0,
 vote: boolean = false,
 createDate: string | null = null,
 lastUpdate: string | null = null,
 user: User = new User,
 priceReport: PriceReport = new PriceReport,
 ){
  this.id = id;
  this.vote = vote;
  this.createDate = createDate;
  this.lastUpdate = lastUpdate;
  this.user = user;
  this.priceReport = priceReport;
 }
}
