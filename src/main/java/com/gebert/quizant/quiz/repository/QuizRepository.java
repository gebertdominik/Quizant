package com.gebert.quizant.quiz.repository;

import com.gebert.quizant.quiz.model.Quiz;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Optional;

public interface QuizRepository extends PagingAndSortingRepository<Quiz,Long> {

    Optional<Quiz>  findById(Long id);

    Page<Quiz> findAllByOwner_Id(Long ownerId, Pageable pageable);

}
