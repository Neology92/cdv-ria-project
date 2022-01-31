export class Guitar {
  id?: number;
  imgUrl?: string;
  type: string;
  brand: string;
  prodYear: number;
  constructor(
    type: string,
    brand: string,
    prodYear: number,
    imgUrl?: string,
    id?: number
  ) {
    this.type = type;
    this.brand = brand;
    this.imgUrl = imgUrl;
    this.prodYear = prodYear;
    this.id = id;
  }
}
