package com.ernesto.logreg.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ernesto.logreg.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	@Override
	List<Book> findAll();
}
