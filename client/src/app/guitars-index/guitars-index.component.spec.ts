import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GuitarsIndexComponent } from './guitars-index.component';

describe('GuitarsIndexComponent', () => {
  let component: GuitarsIndexComponent;
  let fixture: ComponentFixture<GuitarsIndexComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GuitarsIndexComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GuitarsIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
