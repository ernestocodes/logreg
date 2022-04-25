package com.ernesto.logreg.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ernesto.logreg.models.Book;
import com.ernesto.logreg.repositories.BookRepository;

@Service
public class MainService {

	@Autowired
	private BookRepository bookRepo;

//find all books
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}

//find one book by id
	public Book findOneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}

//create book
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}

//update gift
	public Book updateBook(Book book) {
		return bookRepo.save(book);
	}

//delete gift
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
