package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consulta1RowMapper implements RowMapper<Consulta1> {

    // @Override
    // public Pessoa mapRow(ResultSet rs, int rowNum) throws SQLException {

    //     Pessoa pessoa = new Pessoa();
    //     pessoa.setId(rs.getInt("id"));
    //     pessoa.setNusp(rs.getString("nusp"));
    //     pessoa.setNome(rs.getString("nome"));
    //     return pessoa;
    // }

    @Override
    public Consulta1 mapRow(ResultSet rs, int rowNum) throws SQLException {

        Consulta1 consulta = new Consulta1();
        consulta.setPerfil(rs.getString("perfil"));
        consulta.setServico(rs.getString("servico"));
        return consulta;
    }
}