package com.consulta2;

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
public class Consulta2Controller {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/consulta2")
    public String consulta2(Model model) {
        List<Consulta2> consulta2 = jdbcTemplate.query(
            "SELECT * FROM consulta2();",
            new Consulta2RowMapper());
        model.addAttribute("consulta2", consulta2);
        return "consulta2";
    }
}