import { Clinica } from '../entities/clinica.entity';
import { IsString } from 'class-validator';
export class CreateClinicaDto extends Clinica {
  @IsString()
  nome: string;
  @IsString()
  cnpj: string;
}
