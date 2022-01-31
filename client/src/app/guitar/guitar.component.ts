import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { ActivatedRoute } from '@angular/router';

import { GuitarService } from '../guitar.service';
import { Guitar } from '../resources/guitar';

@Component({
  selector: 'app-guitar',
  templateUrl: './guitar.component.html',
  styleUrls: ['./guitar.component.scss'],
})
export class GuitarComponent implements OnInit {
  guitar?: Guitar;

  constructor(
    private route: ActivatedRoute,
    private guitarService: GuitarService,
    private location: Location
  ) {}

  ngOnInit(): void {
    this.getGuitar();
  }

  getGuitar(): void {
    const pathId = this.route.snapshot.paramMap.get('id');
    if (pathId) {
      this.guitarService
        .getGuitar(+pathId)
        .subscribe((guitar) => (this.guitar = guitar));
    }
  }

  goBack(): void {
    this.location.back();
  }

  save(): void {
    this.guitarService
      .updateGuitar(this.guitar!)
      .subscribe(() => this.goBack());
  }
}
