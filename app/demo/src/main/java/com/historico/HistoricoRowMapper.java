package com.example.demo;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HistoricoRowMapper implements RowMapper<Historico> {

    @Override
    public Historico mapRow(ResultSet rs, int rowNum) throws SQLException {
        Historico historico = new Historico();
        historico.setId(rs.getInt("id"));
        historico.setIdPessoa(rs.getInt("id_pessoa"));
        historico.setIdServico(rs.getInt("id_servico"));
        historico.setData(rs.getTimestamp("data"));
        return historico;
    }
}