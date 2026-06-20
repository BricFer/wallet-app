package com.walletapp.demo.service;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.walletapp.demo.constants.Message;
import com.walletapp.demo.dtos.request.user.UserRequestDto;
import com.walletapp.demo.dtos.response.UserResponseDto;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.repository.WalletAppUserRepository;

import lombok.AllArgsConstructor;

@Service
@Transactional(readOnly = true)
@AllArgsConstructor
public class UserService {
    private WalletAppUserRepository userRepo;

    @Transactional
    public UserResponseDto saveUser(UserRequestDto dto, String firebaseUid) {
        // TODO: eliminar esta linea
        System.out.println(">>> saveUser - firebaseUid recibido: " + firebaseUid);
        User user = new User();
        user.setAddress(dto.getAddress());
        user.setCountry(dto.getCountry());
        user.setDateOfBirth(dto.getDateOfBirth());
        user.setDefaultCurrency(dto.getDefaultCurrency());
        user.setEmail(dto.getEmail());
        user.setFirebaseUid(firebaseUid);
        user.setFullname(dto.getFullname());
        user.setPhoneNumber(dto.getPhoneNumber());
        user.setUsername(dto.getUsername());

        User saved = userRepo.save(user);

        // TODO: eliminar esta linea
        System.out.println(">>> saveUser - usuario guardado con firebaseUid: " + saved.getFirebaseUid());
        return toResponseDto(saved);
    }

    @Transactional
    public void updateUserUsername(Long userId, String username) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setUsername(username);

        userRepo.save(user);
    }

    @Transactional
    public void updateUserFullname(Long userId, String fullname) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setFullname(fullname);

        userRepo.save(user);
    }

    @Transactional
    public void updateUserPhoneNumber(Long userId, String phoneNumber) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setPhoneNumber(phoneNumber);

        userRepo.save(user);
    }

    @Transactional
    public void updateUserDateOfBirth(Long userId, LocalDateTime dateOfBirth) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setDateOfBirth(dateOfBirth);

        userRepo.save(user);
    }

    @Transactional
    public void updateUserAddress(Long userId, String address) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setAddress(address);

        userRepo.save(user);
    }

    @Transactional
    public void updateUserEmail(Long userId, String email) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setEmail(email);

        userRepo.save(user);
    }

    @Transactional
    public void updateUserCountry(Long userId, String country) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setCountry(country);

        userRepo.save(user);
    }

    @Transactional
    public void updateDefaultCurrency(Long userId, String currency) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        user.setDefaultCurrency(currency);

        userRepo.save(user);
    }

    public UserResponseDto getUserByFirebaseUid(String firebaseUid) {
        User user = userRepo.findByFirebaseUid(firebaseUid)
                .orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        return toResponseDto(user);
    }

    public UserResponseDto getUserById(Long userId) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        return toResponseDto(user);
    }

    @Transactional
    public void deleteUser(Long userId) {
        userRepo.findById(userId).orElseThrow(() -> new RuntimeException(Message.USER_NOT_FOUND));

        userRepo.deleteById(userId);
    }

    private UserResponseDto toResponseDto(User user) {
        return new UserResponseDto(
                user.getId(),
                user.getUsername(),
                user.getFullname(),
                user.getPhoneNumber(),
                user.getDateOfBirth(),
                user.getAddress(),
                user.getEmail(),
                user.getCountry(),
                user.getDefaultCurrency());
    }
}
