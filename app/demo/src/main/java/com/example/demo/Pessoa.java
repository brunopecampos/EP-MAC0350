package com.example.demo;

public class Pessoa {

    private Integer id;
    private String cpf;
    private String nome;
    private String endereco;
    private String instituicao;
    private String login;
    private String senha;
    private String data_nasc;

    public Pessoa() {
        this.id = -1;
    }

    public Pessoa(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCpf(){
        return this.cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return this.endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getInstituicao() {
        return this.instituicao;
    }

    public void setInstituicao(String instituicao) {
        this.instituicao = instituicao;
    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return this.senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getDataNasc() {
        return this.data_nasc;
    }

    public void setDataNasc(String data_nasc) {
        this.data_nasc = data_nasc;
    }


}


// package com.example.demo;

// public class Pessoa {

//     private Integer id;
//     private String nusp;
//     private String nome;

//     public Pessoa() {
//         this.id = -1;
//     }

//     public Pessoa(Integer id) {
//         this.id = id;
//     }

//     public Integer getId() {
//         return id;
//     }

//     public void setId(Integer id) {
//         this.id = id;
//     }

//     public String getNusp() {
//         return this.nusp;
//     }

//     public void setNusp(String content) {
//         this.nusp = content;
//     }

//     public String getNome() {
//         return nome;
//     }

//     public void setNome(String nome) {
//         this.nome = nome;
//     }
// }