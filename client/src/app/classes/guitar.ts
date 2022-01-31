export class Guitar {
  id?: number;
  type: string;
  brand: string;
  prodYear: number;
  constructor(type: string, brand: string, prodYear: number, id?: number) {
    this.type = type;
    this.brand = brand;
    this.prodYear = prodYear;
    this.id = id;
  }
}
