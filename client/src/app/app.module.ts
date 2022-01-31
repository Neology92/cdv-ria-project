import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GuitarsIndexComponent } from './guitars-index/guitars-index.component';
import { GuitarComponent } from './guitar/guitar.component';
import { GuitarService } from './guitar.service';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [AppComponent, GuitarsIndexComponent, GuitarComponent],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule, FormsModule],
  providers: [GuitarService],
  bootstrap: [AppComponent],
})
export class AppModule {}
