import { Controller, Get, Body, Patch, Param } from '@nestjs/common';
import { ClinicaService } from './clinica.service';
import { UpdateClinicaDto } from './dto/update-clinica.dto';

@Controller('clinica')
export class ClinicaController {
  constructor(private readonly clinicaService: ClinicaService) {}

  @Get()
  findAll() {
    return this.clinicaService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.clinicaService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateClinicaDto: UpdateClinicaDto) {
    return this.clinicaService.update(+id, updateClinicaDto);
  }
}
