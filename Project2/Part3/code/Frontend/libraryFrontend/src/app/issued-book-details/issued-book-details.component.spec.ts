import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IssuedBookDetailsComponent } from './issued-book-details.component';

describe('IssuedBookDetailsComponent', () => {
  let component: IssuedBookDetailsComponent;
  let fixture: ComponentFixture<IssuedBookDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IssuedBookDetailsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IssuedBookDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
