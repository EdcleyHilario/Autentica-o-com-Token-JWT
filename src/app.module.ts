import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { UserModule } from './user/user.module';
import { ClinicaModule } from './clinica/clinica.module';

@Module({
  imports: [PrismaModule, UserModule, ClinicaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
