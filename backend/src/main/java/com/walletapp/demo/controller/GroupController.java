package com.walletapp.demo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.walletapp.demo.dtos.request.GroupRequestDto;
import com.walletapp.demo.dtos.response.GroupResponseDto;
import com.walletapp.demo.service.GroupService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/groups")
@AllArgsConstructor
public class GroupController {
    private GroupService groupService;

    @PostMapping
    public ResponseEntity<GroupResponseDto> saveGroup(@RequestBody GroupRequestDto dto, @RequestHeader Long userId) {
        return ResponseEntity.status(HttpStatus.CREATED).body(groupService.saveGroup(dto, userId));
    }

    @PutMapping("/{groupId}")
    public ResponseEntity<GroupResponseDto> updateGroup(@RequestHeader Long userId, @PathVariable Long groupId, @RequestBody GroupRequestDto dto) {
        return ResponseEntity.ok(groupService.updateGroup(dto, userId, groupId));
    }

    @GetMapping("/{groupId}")
    public ResponseEntity<GroupResponseDto> getGroup(@RequestHeader Long userId, @PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.getGroup(userId, groupId));
    }

    @GetMapping
    public ResponseEntity<List<GroupResponseDto>> getAllGroups(@RequestHeader Long userId) {
        return ResponseEntity.ok(groupService.getAllGroups(userId));
    }

    @GetMapping("/active-groups")
    public ResponseEntity<List<GroupResponseDto>> getAllActiveGroups(@RequestHeader Long userId) {
        return ResponseEntity.ok(groupService.getAllActiveGroups(userId));
    }

    @DeleteMapping("/{groupId}")
    public ResponseEntity<Void> deleteGroup(@RequestHeader Long userId, @PathVariable Long groupId) {
        groupService.deleteGroup(userId, groupId);

        return ResponseEntity.noContent().build();
    }
}
