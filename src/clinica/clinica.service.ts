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
    const { nome, cnpj } = updateClinicaDto;
    const updateUser = await this.prisma.clinica.update({
      where: {
        id: id,
      },
      data: {
        nome: nome,
        cnpj: cnpj,
      },
    });
    return `This action updates a #${updateUser.nome} ok`;
  }
}
