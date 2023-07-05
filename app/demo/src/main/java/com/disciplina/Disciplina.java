package com.example.demo;
import java.sql.Timestamp;

public class Disciplina {

    private Integer id;
    private String codigo;
    private String ementa;
    private Timestamp dataCriacao;  

    public Disciplina() {
        this.id = -1;
    }

    public Disciplina(Integer id) {
        this.id = id;
    }

    public void setId(Integer id) {
        this.id = id;
    }   
    public Integer getId() {
        return id;
    }   
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }   
    public String getCodigo() {
        return codigo;
    }   
    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }   
    public String getEmenta() {
        return ementa;
    }   
    public void setDataCriacao(Timestamp dataCriacao) {
        this.dataCriacao = dataCriacao;
    }   
    public Timestamp getDataCriacao() {
        return dataCriacao;
    } 

}