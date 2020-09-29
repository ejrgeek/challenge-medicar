import { DoctorModel } from "../doctor/doctor.model";

export interface ConsultResponseModel {
    id: number;
    day: string;
    time: string;
    scheduling_date?: string;
    doctor: DoctorModel;
}