package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PessoaRowMapper implements RowMapper<Pessoa> {

    // @Override
    // public Pessoa mapRow(ResultSet rs, int rowNum) throws SQLException {

    //     Pessoa pessoa = new Pessoa();
    //     pessoa.setId(rs.getInt("id"));
    //     pessoa.setNusp(rs.getString("nusp"));
    //     pessoa.setNome(rs.getString("nome"));
    //     return pessoa;
    // }

    @Override
    public Pessoa mapRow(ResultSet rs, int rowNum) throws SQLException {

        Pessoa pessoa = new Pessoa();
        pessoa.setId(rs.getInt("id"));
        pessoa.setCpf(rs.getString("cpf"));
        pessoa.setNome(rs.getString("nome"));
        pessoa.setEndereco(rs.getString("endereco"));
        pessoa.setInstituicao(rs.getString("instituicao"));
        pessoa.setLogin(rs.getString("login"));
        pessoa.setSenha(rs.getString("senha"));
        pessoa.setDataNasc(rs.getString("data_nasc"));
        return pessoa;
    }
}