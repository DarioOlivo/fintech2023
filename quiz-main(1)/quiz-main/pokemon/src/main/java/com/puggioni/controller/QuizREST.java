package com.puggioni.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.puggioni.entities.Pokemon;
import com.puggioni.service.QuizService;

@RestController
@RequestMapping("api")
public class QuizREST {
	
	@Autowired
	private QuizService service;
	
	
	
	@GetMapping("pokemon")
	public ResponseEntity<List<Pokemon>> getPokemon(){
		return new ResponseEntity<List<Pokemon>>(service.getPokemon(), HttpStatus.OK);
	};
	
	@GetMapping("pokemon/{num}")
	public ResponseEntity<List<Pokemon>> getPokemon(@PathVariable int num){
		return new ResponseEntity<List<Pokemon>>(service.getPokemonRandom(num), HttpStatus.OK);
	};
	
	@GetMapping("pokemonsolo")
	public ResponseEntity<Pokemon> getPokemonSolo(){
		return new ResponseEntity<Pokemon>(service.getPokemonRandom(), HttpStatus.OK);
		
		
	};
}
