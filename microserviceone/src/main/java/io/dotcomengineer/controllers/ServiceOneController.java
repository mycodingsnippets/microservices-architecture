package io.dotcomengineer.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class ServiceOneController {
    @GetMapping("/")
    public String test(){
        return "Hello From First Service";
    }
}
