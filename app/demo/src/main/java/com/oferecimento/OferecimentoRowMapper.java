package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OferecimentoRowMapper implements RowMapper<Oferecimento> {

    @Override
    public Oferecimento mapRow(ResultSet rs, int rowNum) throws SQLException {

        Oferecimento oferecimento = new Oferecimento();
        oferecimento.setId(rs.getInt("id"));
        oferecimento.setIdAluno(rs.getInt("id_aluno"));
        oferecimento.setIdDocente(rs.getInt("id_docente"));
        oferecimento.setIdDisciplina(rs.getInt("id_disciplina"));
        oferecimento.setDataInicio(rs.getTimestamp("data_ini"));
        oferecimento.setDataFim(rs.getTimestamp("data_fim"));
        oferecimento.setNota(rs.getFloat("nota"));
        return oferecimento;
    }
}