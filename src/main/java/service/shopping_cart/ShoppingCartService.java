package service.shopping_cart;

import entites.Customer;
import entites.Produs;
import exception.InexistentItemException;
import exception.InvalidQuantityException;

public interface ShoppingCartService {
    void addToCart(Customer customer, Produs produs);

    void removeFromCart(Customer customer, Produs produs) throws InexistentItemException;

    void updateQuantity(Customer customer,Produs produs, int quantity) throws InvalidQuantityException, InexistentItemException;

    int getQuantity(Customer customer, Produs produs);

    void displayAll(Customer customer);
}

