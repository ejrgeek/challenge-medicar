import { DoctorModel } from '../doctor/doctor.model';

export interface ScheduleModel {
    id: number;
    doctor: DoctorModel;
    day: string;
    schedules: ScheduleTimeModel[];
}

export interface ScheduleTimeModel {
    time: string;
}