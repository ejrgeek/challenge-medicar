import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserModel } from 'src/app/shared/models/auth/register.response.model';
import { HeaderService } from './header.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  user: UserModel = {
    email: '',
    name: '',
    username: ''
  }

  constructor(private service: HeaderService, private router: Router) { }

  getToken(): string {
    try {
      return localStorage.getItem('token');
    } catch (error) {
      return sessionStorage.getItem('token');
    }
  }

  ngOnInit(): void {
    this.service.getUser().subscribe(response =>{
      this.user = response
    });
  }

  logout(){
    this.service.logout().subscribe(
      () => {
        this.service.showMessage('Você saiu!');
      },
      error => {
        this.service.showMessage('Algum erro ocorreu', true);
      },
    );
    localStorage.clear();
    sessionStorage.clear();
    this.router.navigate(['/entrar']);
  }

}
