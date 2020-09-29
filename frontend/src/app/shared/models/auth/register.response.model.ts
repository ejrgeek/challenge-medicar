export interface RegisterResponseModel {
    user: UserModel;
    token: string;
}

export interface UserModel {
    id?: number;
    first_name?: string;
    name?: string,
    username: string;
    email: string;
}