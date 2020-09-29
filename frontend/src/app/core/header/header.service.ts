import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable } from 'rxjs';
import { UserModel } from 'src/app/shared/models/auth/register.response.model';

@Injectable({
  providedIn: 'root'
})
export class HeaderService {

  baseUrl: string = 'http://127.0.0.1:8000/api';

  user: UserModel = {
    email: '',
    first_name: '',
    username: ''
  }

  constructor(private snackBar: MatSnackBar, private http: HttpClient) { }

  showMessage(msg: string, isError: boolean = false): void{
    this.snackBar.open(msg, '', {
      duration: 1500,
      horizontalPosition: 'right',
      verticalPosition: 'top',
      panelClass: isError ? ['sb-error'] : ['sb-success'],
    })
  }

  private _getToken(): string {
    try {
      return localStorage.getItem('token');
    } catch (error) {
      return sessionStorage.getItem('token');
    }
  }

  getUser(): Observable<UserModel> {
    const token = this._getToken();
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.get<UserModel>(
      this.baseUrl+'/user/', { headers: httpHeaders }
    );
  }

  logout(): Observable<any> {
    const token = this._getToken();
    const httpHeaders = new HttpHeaders(
      {'Content-Type': 'application/json',
      'Authorization': 'token ' + token},
    );
    return this.http.post(
      this.baseUrl+'/logout/', { headers: httpHeaders }
    );
  }
}
