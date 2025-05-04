package com.example.backend_mobile.service.ipml;

import com.example.backend_mobile.dtos.response.VeDTO;
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
    public ResponseEntity<List<VeDTO>> getAllHistoryOrder() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (!(authentication.getPrincipal() instanceof UserDetailsImpl)) {
            throw new RuntimeException("Người dùng chưa đăng nhập hoặc sai kiểu dữ liệu!");
        }
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        int currentUserId = userDetails.getId();
        List<Ve> listVe = veRepository.findAll()
                .stream()
                .filter(ve -> ve.getKhachHang().getId().equals(currentUserId))
                .collect(Collectors.toList());

        List<VeDTO> listVeDTO = new ArrayList<>();

        for (Ve ve : listVe) {
            VeDTO dto = new VeDTO();

            dto.setId(ve.getId());
            dto.setMaVe(ve.getMaVe());
            dto.setGia(ve.getGia());
            dto.setNgayTao(ve.getNgayTao());
            dto.setTrangThai(ve.getTrangThai());
            dto.setGhiChu(ve.getGhiChu());

            if (ve.getLichChieuGhe().getLichChieu() != null) {
                dto.setLichChieuId(ve.getLichChieuGhe().getLichChieu().getId());
                if (ve.getLichChieuGhe().getLichChieu().getPhim() != null)
                    dto.setTenPhim(ve.getLichChieuGhe().getLichChieu().getPhim().getTen());
                if (ve.getLichChieuGhe().getLichChieu().getPhong() != null)
                    dto.setTenPhong(ve.getLichChieuGhe().getLichChieu().getPhong().getTen());
            }

            if (ve.getLichChieuGhe().getGhe() != null) {
                dto.setGheId(ve.getLichChieuGhe().getGhe().getId());
                dto.setTenGhe(ve.getLichChieuGhe().getGhe().getTen());
            }

            if (ve.getKhachHang() != null) {
                dto.setKhachHangId(ve.getKhachHang().getId());
                dto.setTenKhachHang(ve.getKhachHang().getTen());
                dto.setEmailKhachHang(ve.getKhachHang().getEmail());
            }

            listVeDTO.add(dto);
        }

        return ResponseEntity.ok(listVeDTO);
    }
}
