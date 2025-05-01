package com.example.backend_mobile.service;

import com.example.backend_mobile.entity.Ve;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ITicketService {
    ResponseEntity<List<Ve>> getAllHistoryOrder();
}
