package com.skilldistillery.fuel4less.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.fuel4less.entities.Tag;

public interface TagRepository extends JpaRepository <Tag, Integer>{
	

}
