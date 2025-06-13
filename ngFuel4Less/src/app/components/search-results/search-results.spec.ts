import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchResults } from './search-results';

describe('SearchResults', () => {
  let component: SearchResults;
  let fixture: ComponentFixture<SearchResults>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SearchResults]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SearchResults);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
