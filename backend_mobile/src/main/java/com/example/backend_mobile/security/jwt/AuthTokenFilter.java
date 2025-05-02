package com.example.backend_mobile.security.jwt;


import com.example.backend_mobile.security.service.UserDetailsServiceImpl;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.text.ParseException;
import com.nimbusds.jose.JOSEException;

@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Component
public class AuthTokenFilter extends OncePerRequestFilter {

    JwtUtils jwtUtils;

    UserDetailsServiceImpl userDetailsService;

    static Logger logger = LoggerFactory.getLogger(AuthTokenFilter.class);

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        logger.info("Request path: {}", request.getServletPath());
        if (request.getServletPath().startsWith("/auth/")) {
            logger.info("Bypassing authentication for auth path");
            filterChain.doFilter(request, response);
            return;
        }

        try {
            String jwt = parseJwt(request);
            if (jwt != null) {
                try {
                    String username = jwtUtils.getUserNameFromToken(jwt);
                    UserDetails userDetails = userDetailsService.loadUserByUsername(username);

                    if (jwtUtils.validateToken(jwt, userDetails)) {
                        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                                userDetails, null, userDetails.getAuthorities());
                        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                        SecurityContextHolder.getContext().setAuthentication(authentication);
                    } else {
                        logger.error("Token không hợp lệ");
                        // KHÔNG set authentication vào SecurityContextHolder
                    }
                } catch (ParseException | JOSEException e) {
                    logger.error("Không thể parse/validate token: {}", e.getMessage());
                    // KHÔNG set authentication vào SecurityContextHolder
                }
            } else {
                logger.info("Không tìm thấy token JWT");
                // KHÔNG set authentication vào SecurityContextHolder
            }
        } catch (Exception e) {
            logger.error("Không thể xác thực người dùng: {}", e.getMessage());
            // KHÔNG set authentication vào SecurityContextHolder
        }

        filterChain.doFilter(request, response);
    }


    private String parseJwt(HttpServletRequest request) {
        String headerAuth = request.getHeader("Authorization");

        if (StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")) {
            return headerAuth.substring(7);
        }

        return null;
    }

}