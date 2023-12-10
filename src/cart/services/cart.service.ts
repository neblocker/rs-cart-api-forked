import { Injectable } from '@nestjs/common';
import { Client } from 'pg';
import { v4 } from 'uuid';

import { Cart } from '../models';

@Injectable()
export class CartService {
  private userCarts: Record<string, Cart> = {};

  constructor(private readonly client: Client) {}

  findByUserId(userId: string): any {
    const data = this.client.query(
      'select c.id as cart_id, pr from carts c inner join cart_items ci on (c.id = ci.cart_id) where c.user_id = ?',
      [userId],
    );

    return data;
  }

  createByUserId(userId: string) {
    const id = v4(v4());
    const userCart = {
      id,
      items: [],
    };

    this.userCarts[userId] = userCart;

    return userCart;
  }

  findOrCreateByUserId(userId: string): Cart {
    const userCart = this.findByUserId(userId);

    if (userCart) {
      return userCart;
    }

    return this.createByUserId(userId);
  }

  updateByUserId(userId: string, { items }: Cart): Cart {
    const { id, ...rest } = this.findOrCreateByUserId(userId);

    const updatedCart = {
      id,
      ...rest,
      items: [...items],
    };

    this.userCarts[userId] = { ...updatedCart };

    return { ...updatedCart };
  }

  removeByUserId(userId): void {
    this.userCarts[userId] = null;
  }
}
