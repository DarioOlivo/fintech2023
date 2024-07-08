package com.puggioni.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.puggioni.entities.Pokemon;

public interface PokemonDAO extends JpaRepository<Pokemon, Integer> {

	@Query(value = "SELECT * FROM pokemon ORDER BY rand() LIMIT :limit", nativeQuery = true)
	List<Pokemon> getPokemonRandom(@Param("limit") int num);
	
	@Query(value = "SELECT * FROM pokemon ORDER BY rand() LIMIT 1", nativeQuery = true)
	List<Pokemon> getPokemonRandom();
}
