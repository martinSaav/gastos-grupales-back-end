package com.gs.service;


import com.gs.dto.GroupResponseDto;
import org.springframework.stereotype.Service;

@Service
public class GroupService implements IGroupService{

    @Override
    public GroupResponseDto getGroupById(Long id) {
        return new GroupResponseDto(id, "Sample Group", "This is a sample group description.");
    }
}
