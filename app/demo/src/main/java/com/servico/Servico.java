package com.example.demo;

public class Servico {

    private Integer id;
    private Integer id_perfil;
    private String codigo;
    private String tipo;
    private String descricao;

    public Servico() {
        this.id = -1;
    }

    public Servico(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setIdPerfil(Integer id_perfil) {
        this.id_perfil = id_perfil;
    }
    
    public Integer getIdPerfil() {
        return id_perfil;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public String getCodigo() {
        return codigo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public String getDescricao() {
        return descricao;
    }
    
}