/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tester;

import com.shopping.BookDAO;
import com.shopping.BookDTO;
import com.shopping.Cart;
import com.users.UserDAO;
import com.users.UserDTO;
import com.utils.DBUtils;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class Tester {
    public static void main(String[] args) {
        
        try {
            Cart cart = new Cart();
            BookDTO book = new BookDTO("1", "1", 1, 0);
            cart.add(book);
            System.out.println(cart.getCart().get("1").getQuantity());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
