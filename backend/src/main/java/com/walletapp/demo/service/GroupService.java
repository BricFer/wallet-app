package com.walletapp.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.walletapp.demo.dtos.request.GroupRequestDto;
import com.walletapp.demo.dtos.response.GroupResponseDto;
import com.walletapp.demo.entity.Group;
import com.walletapp.demo.entity.User;
import com.walletapp.demo.repository.GroupRepository;
import com.walletapp.demo.repository.WalletAppUserRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class GroupService {
    private GroupRepository groupRepo;
    private WalletAppUserRepository userRepo;

    public GroupResponseDto saveGroup(GroupRequestDto dto, Long userId) {
        Group group = new Group();

        User user = userRepo.findById(userId).orElseThrow(() -> new RuntimeException("User not found."));

        group.setUser(user);
        group.setName(dto.getName());
        group.setDescription(dto.getDescription());
        group.setBudgetLimit(dto.getBudgetLimit());
        group.setActive(true);

        return toResponseDto(groupRepo.save(group));
    }

    public GroupResponseDto updateGroup(GroupRequestDto dto, Long userId, Long groupId) {

        Group group = groupRepo.findByUserIdAndGroupId(userId, groupId)
                .orElseThrow(() -> new RuntimeException("Group not found."));

        group.setName(dto.getName());
        group.setDescription(dto.getDescription());
        group.setBudgetLimit(dto.getBudgetLimit());
        group.setActive(true);

        return toResponseDto(groupRepo.save(group));
    }

    public List<GroupResponseDto> getAllGroups(Long userId) {
        return groupRepo.findByUserId(userId).stream().map(this::toResponseDto).toList();
    }

    public List<GroupResponseDto> getAllActiveGroups(Long userId) {
        return groupRepo.findByUserIdAndIsActiveTrue(userId).stream().map(this::toResponseDto).toList();
    }

    private GroupResponseDto toResponseDto(Group group) {
        return new GroupResponseDto(
                group.getId(),
                group.getName(),
                group.getDescription(),
                group.getBudgetLimit(),
                group.isActive());
    }

}
