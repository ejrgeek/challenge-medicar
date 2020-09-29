import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ConsultResponseModel } from 'src/app/shared/models/consult/consult.response.model';
import { DoctorModel } from 'src/app/shared/models/doctor/doctor.model';
import { SpecialtyModel } from 'src/app/shared/models/specialty/specialy.model';
import { ConsultService } from '../consult.service';

@Component({
  selector: 'app-delete-consult',
  templateUrl: './delete-consult.component.html',
  styleUrls: ['./delete-consult.component.css']
})
export class DeleteConsultComponent implements OnInit {

  consult: ConsultResponseModel;


  constructor(private router: Router, private acRouter: ActivatedRoute, private service: ConsultService) { }

  getToken(): string {
    try {
      return localStorage.getItem('token');
    } catch (error) {
      return sessionStorage.getItem('token');
    }
  }

  ngOnInit(): void {
    const id = this.acRouter.snapshot.paramMap.get('id');
    const token = this.getToken();
    this.service.getConsult(token, id).subscribe(response => {
      this.consult = response;
    },
    () => {
      this.service.showMessage('Erro ao buscar dados', true);
    });
  }

  delete(): void {
    const id = this.acRouter.snapshot.paramMap.get('id');
    const token = this.getToken();
    this.service.delete(token, id).subscribe(
      () => {
        this.service.showMessage('Consulta desmarcada');
        this.router.navigate(['']);
      },
      () => this.service.showMessage('Ocorreu um erro', true)
    );
  }

  cancel(): void {
    this.router.navigate(['']);
  }

}
