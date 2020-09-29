import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginModel } from 'src/app/shared/models/auth/login.model';
import { LoginService } from './login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  isVisible = false;

  type = 'password';
  icon = 'visibility';
  remember = false;

  login: LoginModel = {
    username: '',
    password: ''
  };

  constructor(private service: LoginService, private router: Router) { }

  ngOnInit(): void {
  }

  setVisible(): void {
    this.isVisible = !this.isVisible;
    this.type = this.isVisible ? 'text' : 'password';
    this.icon = this.isVisible ? 'visibility_off' : 'visibility';
  }

  setRemember(): void{
    this.remember = !this.remember;
  }

  callLogin(): void{
      var resp: string;
      this.service.login(this.login).subscribe(
        response => {
          if (this.remember === true){
            localStorage.setItem('token', response.token);
          }else{
            sessionStorage.setItem('token', response.token);
          }
          this.service.showMessage('Login realizado');
          this.router.navigate(['']);
        },
        () => {
          this.service.showMessage('Verifique sua conexão ou dados inseridos', true);
        }
      );
  }

  callRegister(): void {
    this.router.navigate(['/registro']);
  }

}
