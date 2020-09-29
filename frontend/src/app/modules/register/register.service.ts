import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable } from 'rxjs';
import { LoginModel } from 'src/app/shared/models/auth/login.model';
import { RegisterResponseModel } from 'src/app/shared/models/auth/register.response.model';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {

  baseUrl: string = 'http://127.0.0.1:8000/api';

  constructor(private snackBar: MatSnackBar, private http: HttpClient) { }

  showMessage(msg: string, isError: boolean = false): void{
    this.snackBar.open(msg, '', {
      duration: 1500,
      horizontalPosition: 'right',
      verticalPosition: 'top',
      panelClass: isError ? ['sb-error'] : ['sb-success'],
    })
  }


  register(model: LoginModel): Observable<RegisterResponseModel> {
    return this.http.post<RegisterResponseModel>(
      this.baseUrl+'/register/',
      model
    );
  }

  postWithToken(endpoint: string, object: any, token: string): Observable<any> {
    const url = `${this.baseUrl}/${endpoint}`
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.post<any>(url, object, { headers: httpHeaders });
  }
}
