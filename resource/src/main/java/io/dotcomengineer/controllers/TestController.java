package io.dotcomengineer.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @RequestMapping("/")
    @PreAuthorize("hasRole('ROLE_operator')")
    public String helloWorld(){
        return "Hello World";
    }

    @RequestMapping("/secured")
    @PreAuthorize("hasAuthority('create_profile')")
    public String securedPoint(){return "Sensitive Data";}
}
