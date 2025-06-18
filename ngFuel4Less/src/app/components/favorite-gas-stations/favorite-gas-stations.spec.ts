import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavoriteGasStations } from './favorite-gas-stations';

describe('FavoriteGasStations', () => {
  let component: FavoriteGasStations;
  let fixture: ComponentFixture<FavoriteGasStations>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FavoriteGasStations]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FavoriteGasStations);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
