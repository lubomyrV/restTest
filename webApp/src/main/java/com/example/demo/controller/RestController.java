package com.example.demo.controller;

import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@org.springframework.web.bind.annotation.RestController
public class RestController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/getAmount")
    public Double payments(@RequestBody String customerName){
        return customerService.getPayments(customerName);
    }
}
