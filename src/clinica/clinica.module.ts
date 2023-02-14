import { Module } from '@nestjs/common';
import { ClinicaService } from './clinica.service';
import { ClinicaController } from './clinica.controller';
import { PrismaModule } from 'src/prisma/prisma.module';
import { UserModule } from 'src/user/user.module';

@Module({
  imports: [PrismaModule, UserModule, ClinicaModule],
  controllers: [ClinicaController],
  providers: [ClinicaService],
})
export class ClinicaModule {}
