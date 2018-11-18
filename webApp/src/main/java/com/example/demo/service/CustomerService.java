package com.example.demo.service;

import com.example.demo.dao.CustomerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerService {

    @Autowired
    private CustomerDAO customerDAO;

    public Double getPayments(String customerName){
        return customerDAO.allPaymentsByCustomerName(customerName);
    }

}
