package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.entity.Ghe;
import com.example.backend_mobile.entity.Ve;
import com.example.backend_mobile.repository.VeRepository;
import com.example.backend_mobile.security.service.UserDetailsImpl;
import com.example.backend_mobile.service.ITicketService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TicketServiceImpl implements ITicketService {

    VeRepository veRepository;

    @Override
    public ResponseEntity<List<Ve>> getAllHistoryOrder() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        int currentUserId = userDetails.getId();
        List<Ve> listVe = veRepository.findAll().stream()
                .filter(ve -> ve.getKhachHang().getId().equals(currentUserId))
                .peek(ve -> {
                    Ghe ghe = ve.getGhe();
                })
                .collect(Collectors.toList());

        return ResponseEntity.ok(listVe);
    }
}
