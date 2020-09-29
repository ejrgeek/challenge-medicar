import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { ConsultResponseModel } from 'src/app/shared/models/consult/consult.response.model';
import { DoctorModel } from 'src/app/shared/models/doctor/doctor.model';
import { SpecialtyModel } from 'src/app/shared/models/specialty/specialy.model';
import { ConsultService } from './consult.service';

@Component({
  selector: 'app-consult',
  templateUrl: './consult.component.html',
  styleUrls: ['./consult.component.css']
})
export class ConsultComponent implements OnInit {

  consultList: ConsultResponseModel[];

  displayedColumns = ['specialty', 'doctor', 'date', 'hour', 'action'];

  constructor(private router: Router, private sbar: MatSnackBar, private service: ConsultService) { }

  getToken(): string {
    try {
      return localStorage.getItem('token');
    } catch (error) {
      return sessionStorage.getItem('token');
    }
  }

  ngOnInit(): void {
    const token = this.getToken();
    if(token){
      this.getConsult();
    }else{
      this.sbar.open('Você precisa se autenticar', '', {
        duration: 1500,
        horizontalPosition: 'right',
        verticalPosition: 'top',
        panelClass: ['sb-error'],
      });
      this.router.navigate(['/entrar']);
    }
  }

  getConsult(): void {
    const token = this.getToken();
    this.service.getConsultList(token).subscribe(response => {
      this.consultList = response;
    },
    error => {
      console.log(error);
      this.service.showMessage('ERRO DESCONHECIDO', true);
    });
  }

}
