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
public class PerfilpessoaController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/perfilpessoas")
    public String listaPerfilpessoa(Model model) {
        List<Perfilpessoa> perfilpessoas = jdbcTemplate.query(
                "SELECT * FROM perfil_pessoa ORDER BY id DESC",
                new PerfilpessoaRowMapper());
        model.addAttribute("listaPerfilpessoas", perfilpessoas);
        return "perfilpessoas";
    }

    @GetMapping("/perfilpessoa")
    public String formPerfilpessoa(Model model) {
        model.addAttribute("perfilpessoa", new Perfilpessoa());
        return "perfilpessoa";
    }

    @GetMapping("/perfilpessoa/{id}")
    public String editPerfilpessoa(Model model, @PathVariable Integer id) {
        Perfilpessoa perfilpessoa = jdbcTemplate.queryForObject("SELECT * FROM perfil_pessoa WHERE id = ?", 
            new PerfilpessoaRowMapper(), id);
        model.addAttribute("perfilpessoa", perfilpessoa);
        return "perfilpessoa";
    }

    @PostMapping("/perfilpessoa")
    public String submitPerfilpessoa(@ModelAttribute Perfilpessoa perfilpessoa, Model model) {
        if (perfilpessoa.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE perfil_pessoa SET id_perfil = ?, id_pessoa = ? WHERE id = ?",
                perfilpessoa.getIdPerfil(),
                perfilpessoa.getIdPessoa(),
                perfilpessoa.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO perfil_pessoa(id_perfil, id_pessoa) VALUES (?, ?)", 
                perfilpessoa.getIdPerfil(),
                perfilpessoa.getIdPessoa()
            );
        }
        return "redirect:/perfilpessoas";
    }

    @DeleteMapping("/perfilpessoa/{id}")
    public String deletePerfilpessoa(@PathVariable Integer id) {
        jdbcTemplate.update("DELETE FROM perfil_pessoa WHERE id = ?", id);
        return "redirect:/perfilpessoas";
    }

    
}
