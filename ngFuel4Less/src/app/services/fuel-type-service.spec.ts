import { TestBed } from '@angular/core/testing';

import { FuelTypeService } from './fuel-type-service';

describe('FuelTypeService', () => {
  let service: FuelTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FuelTypeService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
