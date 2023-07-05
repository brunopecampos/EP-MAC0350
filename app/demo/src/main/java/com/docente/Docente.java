package com.example.demo;

public class Docente {

    private Integer id;
    private Integer id_pessoa;
    private String especialidade;

    public Docente() {
        this.id = -1;
    }

    public Docente(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setIdPessoa(Integer id_pessoa) {
        this.id_pessoa = id_pessoa;
    }
    
    public Integer getIdPessoa() {
        return id_pessoa;
    }
    
    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }
    
    public String getEspecialidade() {
        return especialidade;
    }
    
}