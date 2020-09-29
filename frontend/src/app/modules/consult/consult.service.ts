import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable } from 'rxjs';
import { ConsultResponseModel } from 'src/app/shared/models/consult/consult.response.model';
import { ScheduleModel } from 'src/app/shared/models/schedule/schedule.model';
import { SpecialtyModel } from 'src/app/shared/models/specialty/specialy.model';

@Injectable({
  providedIn: 'root'
})
export class ConsultService {

  baseUrl: string = 'http://127.0.0.1:8000/api';

  constructor(private snackBar: MatSnackBar, private http: HttpClient) { }

  showMessage(msg: string, isError: boolean = false): void{
    this.snackBar.open(msg, '', {
      duration: 1500,
      horizontalPosition: 'right',
      verticalPosition: 'top',
      panelClass: isError ? ['sb-error'] : ['sb-success'],
    });
  }

  getConsultList(token: string): Observable<ConsultResponseModel[]>{
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.get<ConsultResponseModel[]>(
      this.baseUrl+'/consultas', { headers: httpHeaders }
    );
  }

  getConsult(token: string, id: string): Observable<ConsultResponseModel>{
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.get<ConsultResponseModel>(
      this.baseUrl+'/consultas/'+`${id}/`, { headers: httpHeaders }
    );
  }

  getSpecialtyList(token: string): Observable<SpecialtyModel[]>{
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.get<SpecialtyModel[]>(
      this.baseUrl+'/especialidades/', { headers: httpHeaders }
    );
  }

  getScheduleList(token: string): Observable<ScheduleModel[]>{
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.get<ScheduleModel[]>(
      this.baseUrl+'/agendas/', { headers: httpHeaders }
    );
  }

  create(token: string, doctor: any, day: string, time: string): Observable<any>{
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.post(
      this.baseUrl+'/consultas/',
      { day, doctor,time },
      { headers: httpHeaders }
    );
  }

  delete(token: string, id: any): Observable<any>{
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.delete(
      this.baseUrl+'/consultas/'+`${id}/`,
      { headers: httpHeaders }
    );
  }
}
