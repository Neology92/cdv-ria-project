import { Component, OnInit } from '@angular/core';
import { GuitarService } from '../guitar.service';
import { Guitar } from '../resources/guitar';

@Component({
  selector: 'app-guitars-index',
  templateUrl: './guitars-index.component.html',
  styleUrls: ['./guitars-index.component.scss'],
})
export class GuitarsIndexComponent implements OnInit {
  guitars!: Guitar[];

  constructor(private guitarService: GuitarService) {}

  ngOnInit(): void {
    this.getGuitars();
  }

  getGuitars(): void {
    this.guitarService.getGuitars().subscribe((guitars) => {
      this.guitars = guitars;
    });
  }

  create(type: string, brand: string, prodYear: number, imgUrl?: string): void {
    this.guitarService
      .createGuitar(new Guitar(type, brand, prodYear, imgUrl))
      .subscribe((guitar) => {
        this.guitars.push(guitar);
      });
  }

  delete(guitar: Guitar): void {
    this.guitars = this.guitars.filter((s) => s.id !== guitar.id);
    this.guitarService.deleteGuitar(guitar).subscribe();
  }
}
