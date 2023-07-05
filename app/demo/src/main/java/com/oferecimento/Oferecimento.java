package com.example.demo;
import java.sql.Timestamp;

public class Oferecimento {
    private Integer id;
    private Integer idAluno;
    private Integer idDocente;
    private Integer idDisciplina;
    private Timestamp dataInicio;
    private Timestamp dataFim;
    private Float nota;

    public Oferecimento() {
        this.id = -1;
    }

    public Oferecimento(Integer id) {
        this.id = id;
    }

    public void setId(Integer id) {
        this.id = id;
    }   
    public Integer getId() {
        return id;
    }   

    public Integer getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(Integer idAluno) {
        this.idAluno = idAluno;
    }

    public Integer getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(Integer idDocente) {
        this.idDocente = idDocente;
    }

    public Integer getIdDisciplina() {
        return idDisciplina;
    }

    public void setIdDisciplina(Integer idDisciplina) {
        this.idDisciplina = idDisciplina;
    }

    public Timestamp getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Timestamp dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Timestamp getDataFim() {
        return dataFim;
    }

    public void setDataFim(Timestamp dataFim) {
        this.dataFim = dataFim;
    }

    public Float getNota() {
        return nota;
    }

    public void setNota(Float nota) {
        this.nota = nota;
    }

}