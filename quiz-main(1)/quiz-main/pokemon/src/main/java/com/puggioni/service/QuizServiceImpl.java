package com.puggioni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.puggioni.entities.Pokemon;
import com.puggioni.repos.PokemonDAO;

@Service
public class QuizServiceImpl implements QuizService {
	
	@Autowired
	private PokemonDAO dao;
	
	

	@Override
	public List<Pokemon> getPokemon() {
		return dao.findAll();
	}

	@Override
	public List<Pokemon> getPokemonRandom(int num) {
		return dao.getPokemonRandom(num);
	}

	@Override
	public Pokemon getPokemonRandom() {
		return (Pokemon) dao.getPokemonRandom();
	}

}
