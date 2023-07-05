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
public class ServicoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/servicos")
    public String listaServico(Model model) {
        List<Servico> servicos = jdbcTemplate.query(
                "SELECT * FROM servico ORDER BY id DESC",
                new ServicoRowMapper());
        model.addAttribute("listaServicos", servicos);
        return "servicos";
    }

    @GetMapping("/servico")
    public String formServico(Model model) {
        model.addAttribute("servico", new Servico());
        return "servico";
    }

    @GetMapping("/servico/{id}")
    public String editServico(Model model, @PathVariable Integer id) {
        Servico servico = jdbcTemplate.queryForObject("SELECT * FROM servico WHERE id = ?", 
            new ServicoRowMapper(), id);
        model.addAttribute("servico", servico);
        return "servico";
    }

    @PostMapping("/servico")
    public String submitServico(@ModelAttribute Servico servico, Model model) {
        if (servico.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE servico SET id_perfil = ?, codigo = ?, tipo = ?, descricao = ? WHERE id = ?",
                servico.getIdPerfil(),
                servico.getCodigo(),
                servico.getTipo(),
                servico.getDescricao(),
                servico.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO servico(id_perfil, codigo, tipo, descricao) VALUES (?, ?, ?, ?)", 
                servico.getIdPerfil(),
                servico.getCodigo(),
                servico.getTipo(),
                servico.getDescricao()
            );
        }
        return "redirect:/servicos";
    }

    @DeleteMapping("/servico/{id}")
    public String deleteServico(@PathVariable Integer id) {
        jdbcTemplate.update("DELETE FROM servico WHERE id = ?", id);
        return "redirect:/servicos";
    }

    
}
