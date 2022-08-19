package com.mnav.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnav.bookclub.models.Book;
import com.mnav.bookclub.repositories.BookRepository;

@Service
public class BookService {
@Autowired BookRepository bookrepository;

// Find all books 
public List<Book> fetchAllBooks() {
	return bookrepository.findAll();
}

// Find one book by id

public Book getOneBook(Long id) {
	Optional<Book> optionalBook = bookrepository.findById(id);
	if(optionalBook.isEmpty()) return null;
	return optionalBook.get();
}

// Delete a book

public void removeBook(Book book) {
	bookrepository.delete(book);
}

// Save a book

public Book saveBook(Book book) {
	return bookrepository.save(book);
}

}
