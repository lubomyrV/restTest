package com.example.demo.dao;

import com.example.demo.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface CustomerDAO extends JpaRepository<Customer, Integer> {

    @Query(value="SELECT SUM(payments.amount) " +
            "FROM customers INNER JOIN payments ON customers.customerNumber = payments.customerNumber " +
            "WHERE customers.customerName = ?1", nativeQuery = true)
    Double allPaymentsByCustomerName(String customerName);

}
