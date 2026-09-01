package com.walletapp.demo.filter;

import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.repository.WalletAppUserRepository;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;

@Component
@AllArgsConstructor
public class FirebaseAuthFilter extends OncePerRequestFilter {

    private WalletAppUserRepository userRepo;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        if (request.getMethod().equals("OPTIONS")) {
            filterChain.doFilter(request, response);
            return;
        }

        String authHeader = request.getHeader("Authorization");

        // Si no viene el token, pone el estatus a 401 y corta la petición. Previniendo que cualquier request sin token pase
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String token = authHeader.substring(7);

        try {
            FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(token);
            String firebaseUid = decodedToken.getUid();

            User user = userRepo.findByFirebaseUid(firebaseUid).orElse(null);

            // Token válido pero aún no tiene un perfil creado en la BBDD de la app
            if (user == null) {
                request.setAttribute("firebaseUid", firebaseUid);
            } else {
                request.setAttribute("userId", user.getId());
            }

        } catch (FirebaseAuthException e) {
            // Si el token no es válido corta aquí
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        filterChain.doFilter(request, response);
    }
}
