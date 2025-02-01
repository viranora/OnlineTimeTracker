package org.onlinetimetracker.payment.controller;

import org.onlinetimetracker.payment.dto.PaymentRequest;
import org.onlinetimetracker.payment.dto.PaymentResponse;
import org.onlinetimetracker.payment.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping("/create")
    public ResponseEntity<PaymentResponse> createPayment(@RequestBody PaymentRequest paymentRequest) {
        PaymentResponse paymentResponse = paymentService.createPayment(paymentRequest);
        if ("success".equalsIgnoreCase(paymentResponse.getStatus())) {
            return ResponseEntity.ok(paymentResponse);
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(paymentResponse);
        }
    }
}