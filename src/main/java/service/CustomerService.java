package service;

import com.res.dao.CustomerDAO;
import com.res.model.Customer;

public class CustomerService {
    private CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    public boolean registerCustomer(String username, String email, String password) {
        Customer customer = new Customer(username, email, password);
        return customerDAO.createCustomer(customer);
    }

    public Customer authenticateCustomer(String username, String password) {
        Customer customer = customerDAO.getCustomerByUsername(username);
        if (customer != null && customer.getPassword().equals(password)) {
            return customer;
        }
        return null;
    }
}