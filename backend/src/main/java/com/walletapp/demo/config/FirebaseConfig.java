package com.walletapp.demo.config;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import jakarta.annotation.PostConstruct;

@Configuration
public class FirebaseConfig {

    @PostConstruct
    public void init() throws IOException {
        System.out.println(">>> Inicializando Firebase...");

        String credentialsJson = System.getenv("FIREBASE_CREDENTIALS_JSON");

        System.out.println(">>> FIREBASE_CREDENTIALS_JSON es null: " + (credentialsJson == null));

        if (credentialsJson == null) {
            System.out.println(">>> ERROR: Variable de entorno no encontrada");
            return;
        }

        try {

            InputStream serviceAccount = new ByteArrayInputStream(credentialsJson.getBytes());

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            System.out.println(">>> Firebase inicializado correctamente");

            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
            }
        } catch (Exception e) {
            System.out.println(">>> ERROR inicializando Firebase: " + e.getMessage());
        }
    }
}
