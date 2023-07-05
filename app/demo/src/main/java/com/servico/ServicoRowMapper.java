package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServicoRowMapper implements RowMapper<Servico> {

    @Override
    public Servico mapRow(ResultSet rs, int rowNum) throws SQLException {

        Servico servico = new Servico();
        servico.setId(rs.getInt("id"));
        servico.setIdPerfil(rs.getInt("id_perfil"));
        servico.setCodigo(rs.getString("codigo"));
        servico.setTipo(rs.getString("tipo"));
        servico.setDescricao(rs.getString("descricao"));
        return servico;
    }
}