import { TestBed } from '@angular/core/testing';

import { PriceReportService } from './price-report-service';

describe('PriceReportService', () => {
  let service: PriceReportService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PriceReportService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
