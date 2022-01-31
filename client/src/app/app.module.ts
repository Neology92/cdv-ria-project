import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GuitarsIndexComponent } from './guitars-index/guitars-index.component';
import { GuitarComponent } from './guitar/guitar.component';

@NgModule({
  declarations: [
    AppComponent,
    GuitarsIndexComponent,
    GuitarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
