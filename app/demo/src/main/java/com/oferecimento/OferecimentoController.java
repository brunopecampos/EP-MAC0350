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
public class OferecimentoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/oferecimentos")
    public String listaOferecimento(Model model) {
        List<Oferecimento> oferecimentos = jdbcTemplate.query(
                "SELECT * FROM oferecimento ORDER BY id DESC",
                new OferecimentoRowMapper());
        model.addAttribute("listaOferecimentos", oferecimentos);
        return "oferecimentos";
    }

    @GetMapping("/oferecimento")
    public String formOferecimento(Model model) {
        model.addAttribute("oferecimento", new Oferecimento());
        return "oferecimento";
    }

    @GetMapping("/oferecimento/{id}")
    public String editOferecimento(Model model, @PathVariable Integer id) {
        Oferecimento oferecimento = jdbcTemplate.queryForObject("SELECT * FROM oferecimento WHERE id = ?", 
            new OferecimentoRowMapper(), id);
        model.addAttribute("oferecimento", oferecimento);
        return "oferecimento";
    }

    @PostMapping("/oferecimento")
    public String submitOferecimento(@ModelAttribute Oferecimento oferecimento, Model model) {
        if (oferecimento.getId() > 0) {
            jdbcTemplate.update(
                "UPDATE oferecimento SET id_aluno = ?, id_docente = ?, id_disciplina = ?, data_ini = ?, data_fim = ?, nota = ? WHERE id = ?",
                oferecimento.getIdAluno(),
                oferecimento.getIdDocente(),
                oferecimento.getIdDisciplina(),
                oferecimento.getDataInicio(),
                oferecimento.getDataFim(),
                oferecimento.getNota(),
                oferecimento.getId()
            );
        } else {
            jdbcTemplate.update(
                "INSERT INTO oferecimento(id_aluno, id_docente, id_disciplina, data_ini, data_fim, nota) VALUES (?, ?, ?, ?, ?, ?)", 
                oferecimento.getIdAluno(),
                oferecimento.getIdDocente(),
                oferecimento.getIdDisciplina(),
                oferecimento.getDataInicio(),
                oferecimento.getDataFim(),
                oferecimento.getNota()
            );
        }
        return "redirect:/oferecimentos";
    }

    @DeleteMapping("/oferecimento/{id}")
    public String deleteOferecimento(@PathVariable Integer id) {
        jdbcTemplate.update("DELETE FROM oferecimento WHERE id = ?", id);
        return "redirect:/oferecimentos";
    }

    
}
