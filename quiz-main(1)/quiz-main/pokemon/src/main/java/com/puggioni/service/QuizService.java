package com.puggioni.service;

import java.util.List;

import com.puggioni.entities.Pokemon;

public interface QuizService {
	
	List<Pokemon> getPokemon();
	
	//passa num a random di Pokemon
	List<Pokemon> getPokemonRandom(int num);
	
	// ritorna un solo pokemon a random -> overload dei metodi
	Pokemon getPokemonRandom();
	
	// foto pokemon
	

}
