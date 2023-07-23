/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shopping;

import java.util.HashMap;
import java.util.Map;
import javafx.scene.paint.Color;

/**
 *
 * @author Dell
 */
public class Cart {
    private Map<String, BookDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }
    
    public void add(BookDTO book){
        if (this.cart == null){
            this.cart = new HashMap<>();
        }
        if (!this.cart.containsKey(book.getBookID())){
            cart.put(book.getBookID(), book);
        }
        int currentQuantity = this.cart.get(book.getBookID()).getQuantity();
        book.setQuantity(currentQuantity + 1);
    }
    
    public void delete(String bookID){
        if (this.cart == null){
            return;
        }
        if (this.cart.containsKey(bookID)){
            this.cart.remove(bookID);
        }
    }
    
    public void update(String bookID, BookDTO book){
        if (this.cart == null){
            return;
        }
        if (this.cart.containsKey(bookID)){
            this.cart.replace(bookID, book);
        }
    }
}
