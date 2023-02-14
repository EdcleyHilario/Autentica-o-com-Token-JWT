import { Clinica } from '../entities/clinica.entity';
import { IsString } from 'class-validator';
export class CreateClinicaDto extends Clinica {
  @IsString()
  name: string;
  @IsString()
  cnpj: string;
  @IsString()
  address: string;
  @IsString()
  city: string;
  @IsString()
  state: string;
  @IsString()
  contact: string;
}
