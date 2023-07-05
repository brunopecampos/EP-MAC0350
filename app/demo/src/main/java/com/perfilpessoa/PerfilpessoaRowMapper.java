package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PerfilpessoaRowMapper implements RowMapper<Perfilpessoa> {

    @Override
    public Perfilpessoa mapRow(ResultSet rs, int rowNum) throws SQLException {

        Perfilpessoa perfilpessoa = new Perfilpessoa();
        perfilpessoa.setId(rs.getInt("id"));
        perfilpessoa.setIdPerfil(rs.getInt("id_perfil"));
        perfilpessoa.setIdPessoa(rs.getInt("id_pessoa"));
        return perfilpessoa;
    }
}