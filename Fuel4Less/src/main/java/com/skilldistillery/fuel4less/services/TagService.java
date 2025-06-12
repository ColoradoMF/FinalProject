package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.Tag;

public interface TagService {
	
	Tag findById(int id);
	List<Tag> findAll();
	Tag createTag(Tag newTag);
	boolean deleteTagById(int tagId);
}
