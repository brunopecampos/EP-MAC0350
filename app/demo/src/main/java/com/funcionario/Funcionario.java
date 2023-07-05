package com.example.demo;

public class Funcionario {

    private Integer id;
    private Integer id_pessoa;
    private String funcao;

    public Funcionario() {
        this.id = -1;
    }

    public Funcionario(Integer id) {
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
    
    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }
    
    public String getFuncao() {
        return funcao;
    } 
    
}