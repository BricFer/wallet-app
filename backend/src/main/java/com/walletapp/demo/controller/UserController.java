package com.walletapp.demo.controller;

import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.walletapp.demo.constants.Message;
import com.walletapp.demo.dtos.request.user.UserRequestAddressDto;
import com.walletapp.demo.dtos.request.user.UserRequestCountryDto;
import com.walletapp.demo.dtos.request.user.UserRequestDateOfBirthDto;
import com.walletapp.demo.dtos.request.user.UserRequestDefaultCurrencyDto;
import com.walletapp.demo.dtos.request.user.UserRequestDto;
import com.walletapp.demo.dtos.request.user.UserRequestEmailDto;
import com.walletapp.demo.dtos.request.user.UserRequestFullnameDto;
import com.walletapp.demo.dtos.request.user.UserRequestPhoneNumberDto;
import com.walletapp.demo.dtos.request.user.UserRequestUsernameDto;
import com.walletapp.demo.dtos.response.UserResponseDto;
import com.walletapp.demo.service.UserService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/user")
@AllArgsConstructor
public class UserController {
    private UserService userService;

    @PostMapping
    public ResponseEntity<UserResponseDto> saveUser(@RequestBody UserRequestDto dto,
            @RequestHeader String firebaseUid) {
        return ResponseEntity.status(HttpStatus.CREATED).body(userService.saveUser(dto, firebaseUid));
    }

    @GetMapping("/user-info")
    public ResponseEntity<UserResponseDto> getUser(@RequestHeader String firebaseUid) {
        return ResponseEntity.ok(userService.getUserByFirebaseUid(firebaseUid));
    }

    @PatchMapping("/user-info/username")
    public ResponseEntity<String> updateUserUsername(@RequestBody UserRequestUsernameDto dto,
            @RequestHeader Long userId) {

        String username = dto.getUsername();
        userService.updateUserUsername(userId, username);

        return ResponseEntity.ok(Message.USERNAME_UPDATED);
    }

    @PatchMapping("/user-info/fullname")
    public ResponseEntity<String> updateUserFullname(@RequestBody UserRequestFullnameDto dto,
            @RequestHeader Long userId) {

        String fullname = dto.getFullname();
        userService.updateUserFullname(userId, fullname);

        return ResponseEntity.ok(Message.FULLNAME_UPDATED);
    }

    @PatchMapping("/user-info/phone")
    public ResponseEntity<String> updateUserPhoneNumber(@RequestBody UserRequestPhoneNumberDto dto,
            @RequestHeader Long userId) {

        String phoneNumber = dto.getPhoneNumber();
        userService.updateUserPhoneNumber(userId, phoneNumber);

        return ResponseEntity.ok(Message.PHONE_NUMBER_UPDATED);
    }

    @PatchMapping("/user-info/birth")
    public ResponseEntity<String> updateUserDateOfBirth(@RequestBody UserRequestDateOfBirthDto dto,
            @RequestHeader Long userId) {

        LocalDateTime dateOfBirth = dto.getDateOfBirth();
        userService.updateUserDateOfBirth(userId, dateOfBirth);

        return ResponseEntity.ok(Message.BIRTH_UPDATED);
    }

    @PatchMapping("/user-info/address")
    public ResponseEntity<String> updateUserAddress(@RequestBody UserRequestAddressDto dto,
            @RequestHeader Long userId) {

        String address = dto.getAddress();
        userService.updateUserAddress(userId, address);

        return ResponseEntity.ok(Message.ADDRESS_UPDATED);
    }

    @PatchMapping("/user-info/email")
    public ResponseEntity<String> updateUserEmail(@RequestBody UserRequestEmailDto dto, @RequestHeader Long userId) {

        String email = dto.getEmail();
        userService.updateUserEmail(userId, email);

        return ResponseEntity.ok(Message.EMAIL_UPDATED);
    }

    @PatchMapping("/user-info/country")
    public ResponseEntity<String> updateUserCountry(@RequestBody UserRequestCountryDto dto,
            @RequestHeader Long userId) {

        String country = dto.getCountry();
        userService.updateUserCountry(userId, country);

        return ResponseEntity.ok(Message.COUNTRY_UPDATED);
    }

    @PatchMapping("/user-info/currency")
    public ResponseEntity<String> updateUserDefaultCurrency(@RequestBody UserRequestDefaultCurrencyDto dto,
            @RequestHeader Long userId) {

        String defaultCurrency = dto.getDefaultCurrency();
        userService.updateDefaultCurrency(userId, defaultCurrency);

        return ResponseEntity.ok(Message.DEFAULT_CURRENCY_UPDATED);
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteUser(@RequestHeader Long userId) {
        userService.deleteUser(userId);

        return ResponseEntity.noContent().build();
    }
}
