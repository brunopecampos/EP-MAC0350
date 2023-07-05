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
public class PerfilController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/perfils")
    public String listaPerfil(Model model) {
        List<Perfil> perfils = jdbcTemplate.query(
                "SELECT * FROM perfil ORDER BY id DESC",
                new PerfilRowMapper());
        model.addAttribute("listaPerfils", perfils);
        return "perfils";
    }

    @GetMapping("/perfil")
    public String formPerfil(Model model) {
        model.addAttribute("perfil", new Perfil());
        return "perfil";
    }

    @GetMapping("/perfil/{id}")
    public String editPerfil(Model model, @PathVariable Integer id) {
        Perfil perfil = jdbcTemplate.queryForObject("SELECT * FROM perfil WHERE id = ?", 
            new PerfilRowMapper(), id);
        model.addAttribute("perfil", perfil);
        return "perfil";
    }

    @PostMapping("/perfil")
    public String submitPerfil(@ModelAttribute Perfil perfil, Model model) {
        if (perfil.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE perfil SET codigo = ?, tipo = ? WHERE id = ?",
                perfil.getCodigo(),
                perfil.getTipo(),
                perfil.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO perfil(codigo, tipo) VALUES (?, ?)", 
                perfil.getCodigo(),
                perfil.getTipo()
            );
        }
        return "redirect:/perfils";
    }

    @DeleteMapping("/perfil/{id}")
    public String deletePerfil(@PathVariable Integer id) {
        jdbcTemplate.update("DELETE FROM perfil WHERE id = ?", id);
        return "redirect:/perfils";
    }

    
}
