import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewGasStation } from './new-gas-station';

describe('NewGasStation', () => {
  let component: NewGasStation;
  let fixture: ComponentFixture<NewGasStation>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NewGasStation]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NewGasStation);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
