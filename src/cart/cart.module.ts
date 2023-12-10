import { Module } from '@nestjs/common';
import { OrderModule } from '../order/order.module';
import { Client } from 'pg';

import { CartController } from './cart.controller';
import { CartService } from './services';

@Module({
  imports: [OrderModule],
  providers: [
    CartService,
    {
      provide: Client,
      useFactory: () => {
        return new Client({
          host: process.env.DATABASE_HOST,
          user: process.env.DATABASE_USERNAME,
          password: process.env.DATABASE_PASSWORD,
          port: +process.env.DATABASE_PORT,
          database: process.env.DATABASE_NAME,
        });
      },
    },
  ],
  controllers: [CartController],
})
export class CartModule {}
