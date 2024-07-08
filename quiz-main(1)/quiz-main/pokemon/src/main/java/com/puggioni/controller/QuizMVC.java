package com.puggioni.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuizMVC {
	
	@GetMapping("")
	public String home() {
		return "home";
	}

	@GetMapping("quiz")
	public String quiz() {
		return "quiz-pokemon";
	}
	
	@GetMapping("test")
	public String test() {
		return "test-pokedex";
	}
}
