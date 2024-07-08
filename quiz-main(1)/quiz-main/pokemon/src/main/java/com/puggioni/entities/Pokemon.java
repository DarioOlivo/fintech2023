package com.puggioni.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "pokemon")
public class Pokemon {
	
	@Id
	private int id;
	
	private int pokedex;
	
	@Column(name = "name")
	private String nome;
	
	private String type1;
	private String type2;
	
	
	
	
	// Getters e setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPokedex() {
		return pokedex;
	}
	public void setPokedex(int pokedex) {
		this.pokedex = pokedex;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	
}
