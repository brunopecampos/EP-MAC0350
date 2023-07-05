package com.example.demo;

public class Aluno {

    private Integer id;
    private Integer idPessoa;
    private Float notaIngresso;
    private String curso;

    public Aluno() {
        this.id = -1;
    }

    public Aluno(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdPessoa() {
        return this.idPessoa;
    }

    public void setIdPessoa(Integer idPessoa) {
        this.idPessoa = idPessoa;
    }

    public Float getNotaIngresso() {
        return notaIngresso;
    }
    
    public void setNotaIngresso(Float notaIngresso) {
        this.notaIngresso = notaIngresso;
    }
    
    public String getCurso() {
        return curso;
    }
    
    public void setCurso(String curso) {
        this.curso = curso;
    }
}