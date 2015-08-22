package br.com.caelum.agenda.modelo;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Contato {
	private Long id;
	private String nome;
	private String email;
	private String endereco;
	private Calendar dataNascimento;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public Calendar getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Calendar dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	
	@Override
	public String toString() {
		StringBuilder s = new StringBuilder();
		s.append("ID: ").append(this.getId()).append("\n");
		s.append("Nome: ").append(this.getNome()).append("\n");
		s.append("Email: ").append(this.getEmail()).append("\n");
		s.append("Endereco: ").append(this.getEndereco()).append("\n");
		
		String dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(this.getDataNascimento().getTime());
		s.append("Data de Nascimento: ").append(dataFormatada).append("\n");
		
		return s.toString();
	}
	
}
