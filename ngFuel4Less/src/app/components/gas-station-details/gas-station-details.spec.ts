import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GasStationDetails } from './gas-station-details';

describe('GasStationDetails', () => {
  let component: GasStationDetails;
  let fixture: ComponentFixture<GasStationDetails>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GasStationDetails]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GasStationDetails);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
