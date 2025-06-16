import { TestBed } from '@angular/core/testing';

import { SavedAddressService } from './saved-address-service';

describe('SavedAddressService', () => {
  let service: SavedAddressService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SavedAddressService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
