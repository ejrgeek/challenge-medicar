import { SpecialtyModel } from '../specialty/specialy.model';

export interface DoctorModel {
    id?: number;
    name: string;
    crm?: string;
    specialty: SpecialtyModel;
}