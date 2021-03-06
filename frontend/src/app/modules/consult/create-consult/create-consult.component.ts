import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { DoctorModel } from 'src/app/shared/models/doctor/doctor.model';
import { ScheduleModel, ScheduleTimeModel } from 'src/app/shared/models/schedule/schedule.model';
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

  doctorList: DoctorModel[] = [];
  doctorSelected: DoctorModel;

  scheduleList: ScheduleModel[];
  scheduleSelected: ScheduleModel;

  dayList: string[] = [];
  daySelected: string;

  timeList: ScheduleTimeModel[] = [];
  timeSelected: string;

  disableButton = true;

  form: FormGroup = new FormGroup(
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

    this.form.get('specialty').valueChanges.subscribe(
      selected => {
        const token = this.getToken();
        this.service.getScheduleList(token).subscribe(response => {
          this.scheduleList = response;
          this.scheduleList.forEach(
            (schedule) => {
              if (selected.id === schedule.doctor.specialty.id) {
                this.doctorList.push(schedule.doctor);
              }
            }
          );
        });
      }
    );

    this.form.get('doctor').valueChanges.subscribe(
      selected => {
        this.scheduleList.forEach(
          (schedule) => {
            if (selected.id === schedule.doctor.id) {
              this.dayList.push(schedule.day);
            }
          }
        );
      }
    );

    this.form.get('day').valueChanges.subscribe(
      selected => {
        this.scheduleList.forEach(
          (schedule) => {
            if (this.doctorSelected.id === schedule.doctor.id) {
              schedule.schedules.forEach(
                (times) => {
                  this.timeList.push(times);
                }
              );
            }
          }
        );
      }
    );

    this.form.get('hour').valueChanges.subscribe(
      () => {
        this.disableButton = false;
      }
    );

  }

  getToken(): string {
    try {
      return localStorage.getItem('token');
    } catch (error) {
      return sessionStorage.getItem('token');
    }
  }

  getSpecialtyList() {
    const token = this.getToken();
    this.service.getSpecialtyList(token).subscribe(response => {
      this.specialtyList = response;
    });
  }

  create(): void {
    const token = this.getToken();
    const time = this.timeSelected['time'].slice(0, 5)
    console.log(time);
    this.service.create(token,
      this.doctorSelected.id,
      this.daySelected,
      time,
      ).subscribe(
        () => {
          this.service.showMessage('Consulta marcada!')
          this.router.navigate(['']);
        },
        () => this.service.showMessage('Ocorreu um erro', true)
      );
  }

  cancel(): void {
    this.router.navigate(['']);
  }

}
