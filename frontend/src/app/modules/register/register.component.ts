import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RegisterModel } from 'src/app/shared/models/auth/register.model';
import { RegisterService } from './register.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  register: RegisterModel = {
    email: '',
    first_name: '',
    username: '',
    password: ''
  }

  passwordValidate = '';

  type = 'password';
  icon = 'visibility';
  isVisible = false;

  constructor(private router: Router, private service: RegisterService) { }

  ngOnInit(): void {
  }

  setVisible(): void {
    this.isVisible = !this.isVisible;
    this.type = this.isVisible ? 'text' : 'password';
    this.icon = this.isVisible ? 'visibility_off' : 'visibility';
  }

  callRegister(): void {
    this.passwordValidate === this.register.password
    ? this.service.register(this.register).subscribe(
      response => {
        const name = response.user.first_name;
        this.service.showMessage('Bem-vinda(o) ' + name);
        sessionStorage.setItem('token', response.token);
        this.router.navigate(['']);
      },
      () => {
        this.service.showMessage('As senhas precisam ser iguais', true);
      }
    )
    : this.service.showMessage('As senhas precisam ser iguais', true);
  }

  cancel(): void {
    this.router.navigate(['/entrar']);
  }

}
