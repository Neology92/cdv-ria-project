import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { GuitarComponent } from './guitar/guitar.component';
import { GuitarsIndexComponent } from './guitars-index/guitars-index.component';

const routes: Routes = [
  { path: 'guitars/:id', component: GuitarComponent },
  { path: 'guitars', component: GuitarsIndexComponent },
  { path: '', redirectTo: '/guitars', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
