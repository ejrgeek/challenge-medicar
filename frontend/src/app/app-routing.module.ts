import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ConsultComponent } from './modules/consult/consult.component';
import { CreateConsultComponent } from './modules/consult/create-consult/create-consult.component';
import { DeleteConsultComponent } from './modules/consult/delete-consult/delete-consult.component';
import { LoginComponent } from './modules/login/login.component';
import { RegisterComponent } from './modules/register/register.component';

const routes: Routes = [
  {
    path: '',
    component: ConsultComponent
  },
  {
    path: 'consulta',
    component: ConsultComponent
  },
  {
    path: 'consulta/nova',
    component: CreateConsultComponent
  },
  {
    path: 'consulta/desmarcar/:id',
    component: DeleteConsultComponent
  },
  {
    path: 'entrar',
    component: LoginComponent
  },
  {
    path: 'registro',
    component: RegisterComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
