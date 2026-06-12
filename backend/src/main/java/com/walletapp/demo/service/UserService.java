package com.walletapp.demo.service;

import org.springframework.stereotype.Service;

import com.walletapp.demo.dtos.request.UserRequestDto;
import com.walletapp.demo.dtos.response.UserResponseDto;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.repository.WalletAppUserRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserService {
    private WalletAppUserRepository userRepo;

    public UserResponseDto saveUser(UserRequestDto dto, String firebaseUid) {
        User user = new User();
        user.setUsername(dto.getUsername());
        user.setFirebaseUid(firebaseUid);
        user.setPhoneNumber(dto.getPhoneNumber());
        user.setDateOfBirth(dto.getDateOfBirth());
        user.setCountry(dto.getCountry());
        user.setDefaultCurrency(dto.getDefaultCurrency());

        User saved = userRepo.save(user);

        return toResponseDto(saved);
    }

    public UserResponseDto updateUser(UserResponseDto dto, Long userId) {
        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException("User not found."));

        user.setUsername(dto.getUsername());
        user.setPhoneNumber(dto.getPhoneNumber());
        user.setDefaultCurrency(dto.getDefaultCurrency());
        user.setCountry(dto.getCountry());
        user.setDateOfBirth(dto.getDateOfBirth());

        return toResponseDto(userRepo.save(user));
    }

    public UserResponseDto getUser(String firebaseUid) {
        User user = userRepo.findByFirebaseUid(firebaseUid).orElseThrow(() -> new RuntimeException("User not found."));

        return toResponseDto(user);
    }

    private UserResponseDto toResponseDto(User user) {
        return new UserResponseDto(
            user.getId(),
            user.getUsername(),
            user.getPhoneNumber(),
            user.getDateOfBirth(),
            user.getCountry(),
            user.getDefaultCurrency()
        );
    }
}
