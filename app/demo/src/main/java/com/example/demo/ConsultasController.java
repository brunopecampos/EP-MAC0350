package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@Controller
public class ConsultasController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/consulta1")
    public String consulta1(Model model) {
        List<Consulta1> consulta1 = jdbcTemplate.query(
                "SELECT * FROM consulta1();",
                new Consulta1RowMapper());
        model.addAttribute("consulta1", consulta1);
        return "consulta1";
    }

    @GetMapping("/consulta2")
    public String consulta2(Model model) {
        return "consulta2";
    }

    @GetMapping("/consulta3")
    public String consults3(Model model) {
        return "consulta3";
    }

    @GetMapping("/consulta4")
    public String consulta4(Model model) {
        return "consulta4";
    }
}