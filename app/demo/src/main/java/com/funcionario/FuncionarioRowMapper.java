package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FuncionarioRowMapper implements RowMapper<Funcionario> {

    @Override
    public Funcionario mapRow(ResultSet rs, int rowNum) throws SQLException {

        Funcionario funcionario = new Funcionario();
        funcionario.setId(rs.getInt("id"));
        funcionario.setIdPessoa(rs.getInt("id_pessoa"));
        funcionario.setFuncao(rs.getString("funcao"));
        return funcionario;
    }
}