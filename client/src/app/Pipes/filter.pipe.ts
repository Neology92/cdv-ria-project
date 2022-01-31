import { Pipe, PipeTransform } from '@angular/core';
import { Guitar } from '../resources/guitar';

@Pipe({
  name: 'filter',
})
export class FilterPipe implements PipeTransform {
  transform(guitars: Guitar[], fromYear: string, toYear: string) {
    if (fromYear.length !== 0 && Number.isInteger(parseInt(fromYear))) {
      guitars = guitars.filter(
        (guitar) => guitar.prodYear >= parseInt(fromYear)
      );
    }
    if (toYear.length !== 0 && Number.isInteger(parseInt(toYear))) {
      guitars = guitars.filter((guitar) => guitar.prodYear <= parseInt(toYear));
    }

    return guitars;
  }
}
