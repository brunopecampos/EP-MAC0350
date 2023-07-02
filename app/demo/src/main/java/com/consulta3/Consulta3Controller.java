package com.consulta3;

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
public class Consulta3Controller {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/consulta3")
    public String consulta3(Model model) {
        List<Consulta3> consulta3 = jdbcTemplate.query(
                "SELECT * FROM consulta3();",
                new Consulta3RowMapper());
        model.addAttribute("consulta3", consulta3);
        return "consulta3";
    }
}