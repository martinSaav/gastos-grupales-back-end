package com.gs.controller;

import com.gs.service.IGroupService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/v1/groups")
public class GroupController {

    private final IGroupService groupService;

    public GroupController(IGroupService groupService) {
        this.groupService = groupService;
    }

    @PreAuthorize("hasRole('USER')")
    @GetMapping("/{id}")
    public Object getGroupById(@PathVariable Long id) {
        return groupService.getGroupById(id);
    }
}
