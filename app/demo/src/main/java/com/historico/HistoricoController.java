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
public class HistoricoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/historicos")
    public String listaHistorico(Model model) {
        List<Historico> historicos = jdbcTemplate.query(
                "SELECT * FROM historico_servico ORDER BY id DESC",
                new HistoricoRowMapper());
        model.addAttribute("listaHistoricos", historicos);
        return "historicos";
    }

    @GetMapping("/historico")
    public String formHistorico(Model model) {
        model.addAttribute("historico", new Historico());
        return "historico";
    }

    @GetMapping("/historico/{id}")
    public String editHistorico(Model model, @PathVariable Integer id) {
        Historico historico = jdbcTemplate.queryForObject("SELECT * FROM historico_servico WHERE id = ?", 
            new HistoricoRowMapper(), id);
        model.addAttribute("historico", historico);
        return "historico";
    }

    @PostMapping("/historico")
    public String submitHistorico(@ModelAttribute Historico historico, Model model) {
        if (historico.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE historico_servico SET id_servico = ?, id_pessoa = ?, data = ? WHERE id = ?",
                historico.getIdServico(),
                historico.getIdPessoa(),
                historico.getData(),
                historico.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO historico_servico(id_servico, id_pessoa, data) VALUES (?, ?, ?)", 
                historico.getIdServico(),
                historico.getIdPessoa(),
                historico.getData()
            );
        }
        return "redirect:/historicos";
    }

    @DeleteMapping("/historico/{id}")
    public String deleteHistorico(@PathVariable Integer id) {
        jdbcTemplate.update("DELETE FROM historico_servico WHERE id = ?", id);
        return "redirect:/historicos";
    }

    
}
