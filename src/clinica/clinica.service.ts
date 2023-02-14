import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UpdateClinicaDto } from './dto/update-clinica.dto';

@Injectable()
export class ClinicaService {
  constructor(private readonly prisma: PrismaService) {}

  findAll() {
    const getAllClinica = this.prisma.clinica.findMany();
    return getAllClinica;
  }

  findOne(id: number) {
    const getAllClinica = this.prisma.clinica.findMany({
      where: {
        id: id,
      },
    });
    return getAllClinica;
  }

  async update(id: number, updateClinicaDto: UpdateClinicaDto) {
    const { nome, cnpj, address, city, state, contact } = updateClinicaDto;
    const updateUser = await this.prisma.clinica.update({
      where: {
        id: id,
      },
      data: {
        name: nome,
        cnpj: cnpj,
        address: address,
        city: city,
        state: state,
        contact: contact,
      },
    });
    return `This action updates a #${updateUser.name} ok`;
  }
}
