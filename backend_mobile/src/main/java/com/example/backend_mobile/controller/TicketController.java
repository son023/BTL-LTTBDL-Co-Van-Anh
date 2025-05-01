package com.example.backend_mobile.controller;

import com.example.backend_mobile.entity.Ve;
import com.example.backend_mobile.service.ITicketService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ticket")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TicketController {

    ITicketService ticketService;

    @GetMapping("/history/all")
    public ResponseEntity<List<Ve>> allTickets() {
        return ticketService.getAllHistoryOrder();
    }
}
