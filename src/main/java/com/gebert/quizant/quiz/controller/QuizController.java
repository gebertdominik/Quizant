package com.gebert.quizant.quiz.controller;

import com.gebert.quizant.quiz.model.Quiz;
import com.gebert.quizant.quiz.repository.QuizRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.NoResultException;

@RestController()
@RequestMapping("/quiz")
public class QuizController {

    private final QuizRepository quizRepository;

    @GetMapping("{idQuiz}")
    public Quiz findQuizById(@PathVariable("idQuiz") Long idQuiz){
        return quizRepository.findById(idQuiz).orElseThrow( () -> new NoResultException("There is no Quiz with id : " + idQuiz ));
    }

    @GetMapping("/user/{idUser}")
    public Page<Quiz> findAllQuizesForUser(@PathVariable("idUser") Long idUser, Pageable pageable){
        return quizRepository.findAllByOwner_Id(idUser, pageable);
    }


    public QuizController(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }
}
