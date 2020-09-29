import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { DoctorModel } from 'src/app/shared/models/doctor/doctor.model';
import { SpecialtyModel } from 'src/app/shared/models/specialty/specialy.model';
import { ConsultService } from '../consult.service';

@Component({
  selector: 'app-create-consult',
  templateUrl: './create-consult.component.html',
  styleUrls: ['./create-consult.component.css']
})
export class CreateConsultComponent implements OnInit {
  
  specialtyList: SpecialtyModel[];
  specialtySelected: SpecialtyModel;

  doctorList: DoctorModel[];
  doctorSelected: DoctorModel;
  disabledDoctor = new FormControl(true);

  public form: FormGroup = new FormGroup(
    {
      'specialty': new FormControl(null),
      'doctor': new FormControl(null),
      'day': new FormControl(null),
      'hour': new FormControl(null)
    }
  );



  constructor(private router: Router, private service: ConsultService) { }

  ngOnInit(): void {
    this.getSpecialtyList();
  }

  teste(): void{
    console.log('clicou');
  }

  getToken(): string {
    try {
      return localStorage.getItem('token');
    } catch (error) {
      return sessionStorage.getItem('token');
    }
  }

  getSpecialtyList(){
    const token = this.getToken();
    this.service.getSpecialtyList(token).subscribe(response => {
      this.specialtyList = response;
      console.log(this.specialtyList);
    });
  }

  cancel(): void {
    this.router.navigate(['']);
  }

}
