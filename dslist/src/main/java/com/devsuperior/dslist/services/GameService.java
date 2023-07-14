package com.devsuperior.dslist.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.devsuperior.dslist.dto.GameDTO;
import com.devsuperior.dslist.dto.GameMinDTO;
import com.devsuperior.dslist.entities.Game;
import com.devsuperior.dslist.entities.GameList;
import com.devsuperior.dslist.projections.GameMinProjection;
import com.devsuperior.dslist.repositories.GameListRepository;
import com.devsuperior.dslist.repositories.GameRepository;
import com.devsuperior.dslist.services.exceptions.EntityNotFoundException;


@Service
public class GameService {

	@Autowired
	private GameRepository gameRepository;
	
	@Autowired
	private GameListRepository gameListRepository;
	
	
	@Transactional(readOnly = true)
	public GameDTO findById(Long id) {
		Game result = gameRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Resources not found!"));
		GameDTO dto = new GameDTO(result);
		return dto;
		
		//ou return new GameDTO(result);
	}
	
	@Transactional(readOnly = true)
	public List<GameMinDTO> findAll(){
		
		List<Game> result = gameRepository.findAll();
		if(result.isEmpty()) {
			throw new EntityNotFoundException("Is empty!");
		}
		List<GameMinDTO> dto = result.stream().map(x -> new GameMinDTO(x)).toList();
		return dto;
		
		// ou return result.stream().map(x -> new GameMinDTO(x)).toList();
	}
	
	@Transactional(readOnly = true)
	public List<GameMinDTO> findByList(Long listId){
		List<GameList> quantity = gameListRepository.findAll();		
		if(listId == null || listId <= 0 || listId > quantity.size()) {
			throw new EntityNotFoundException("Is empty!");
		}
		List<GameMinProjection> result = gameRepository.searchByList(listId);
		List<GameMinDTO> dto = result.stream().map(x -> new GameMinDTO(x)).toList();
		return dto;
	}
}
