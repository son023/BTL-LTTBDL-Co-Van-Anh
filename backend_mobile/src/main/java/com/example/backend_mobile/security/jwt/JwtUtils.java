package com.example.backend_mobile.security.jwt;


import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

import com.example.backend_mobile.security.service.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class JwtUtils {
    @Value("${app.jwtSecret}")
    private String jwtSecret;

    @Value("${app.jwtExpirationMs}")
    private long jwtExpirationMs;

    @Value("${app.refreshExpirationMs:604800000}") // Default 7 days
    private long refreshExpirationMs;

    public String generateToken(Authentication authentication, boolean isRefresh) {
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS512);
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet.Builder()
                .subject(userDetails.getUsername())
                .claim("id", userDetails.getId())
                .claim("email", userDetails.getEmail())
                .claim("ten", userDetails.getTen())
                .claim("roles", userDetails.getAuthorities().stream()
                        .map(GrantedAuthority::getAuthority)
                        .collect(Collectors.toList()))
                .issuer("rap_phim_online")
                .issueTime(new Date())
                .expirationTime(new Date(Instant.now()
                        .plus(isRefresh ? refreshExpirationMs : jwtExpirationMs, ChronoUnit.MILLIS)
                        .toEpochMilli()))
                .jwtID(UUID.randomUUID().toString())
                .build();

        Payload payload = new Payload(jwtClaimsSet.toJSONObject());

        JWSObject jwsObject = new JWSObject(header, payload);
        try {
            jwsObject.sign(new MACSigner(jwtSecret.getBytes()));
            return jwsObject.serialize();
        } catch (JOSEException e) {
            log.error("Không thể tạo token", e);
            throw new RuntimeException(e);
        }
    }

    public boolean validateToken(String token, UserDetails user) throws JOSEException, ParseException {
        JWSVerifier verifier = new MACVerifier((jwtSecret.getBytes()));
        SignedJWT signedJWT = SignedJWT.parse(token);
        boolean verified = signedJWT.verify(verifier);
        Date expiryTime = signedJWT.getJWTClaimsSet().getExpirationTime();
        String userName = signedJWT.getJWTClaimsSet().getSubject();

        return verified &&
                expiryTime.after(new Date()) &&
                user.getUsername().equals(userName);
    }

    public String getUserNameFromToken(String token) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(token);
        return signedJWT.getJWTClaimsSet().getSubject();
    }

    public Map<String, Object> getClaimsFromToken(String token) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(token);
        return signedJWT.getJWTClaimsSet().getClaims();
    }

    public Integer getKhachHangIdFromToken(String token) throws ParseException {
        Map<String, Object> claims = getClaimsFromToken(token);
        Object customerId = claims.get("id");
        if (customerId != null) {
            return Integer.valueOf(customerId.toString());
        }
        return 1;
    }
}