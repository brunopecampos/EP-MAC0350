package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DisciplinaRowMapper implements RowMapper<Disciplina> {

    @Override
    public Disciplina mapRow(ResultSet rs, int rowNum) throws SQLException {

        Disciplina disciplina = new Disciplina();
        disciplina.setId(rs.getInt("id"));
        disciplina.setCodigo(rs.getString("codigo"));
        disciplina.setEmenta(rs.getString("ementa"));
        disciplina.setDataCriacao(rs.getTimestamp("data_criacao"));
        return disciplina;
    }
}