class CartItemsController < ApplicationController

      def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_path, notice: "Item removed from cart."
      end

      def increment_quantity
        @cart_item = CartItem.find(params[:id])
        @cart_item.quantity += 1
        @cart_item.save
        redirect_to cart_path
      end
      
      def decrement_quantity
        @cart_item = CartItem.find(params[:id])
        @cart_item.quantity -= 1
        @cart_item.save
        redirect_to cart_path
      end
      
end
