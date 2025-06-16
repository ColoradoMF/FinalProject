import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SavedAddress } from './saved-address';

describe('SavedAddress', () => {
  let component: SavedAddress;
  let fixture: ComponentFixture<SavedAddress>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SavedAddress]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SavedAddress);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
