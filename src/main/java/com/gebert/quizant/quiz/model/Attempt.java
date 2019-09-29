package com.gebert.quizant.quiz.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(schema = "quiz")
public class Attempt extends Audit implements Serializable {

    @Id
    @SequenceGenerator(allocationSize = 1,
            initialValue = 1,
            name = "seqAttempt",
            sequenceName = "PK_SEQ_ATTEMPT")
    @GeneratedValue( generator = "seqAttempt", strategy = GenerationType.SEQUENCE )
    private Long id;

    @ManyToOne
    @JoinColumn( name = "ID_QUIZ", referencedColumnName = "ID" )
    private Quiz quiz;

    private String username;

    public Attempt() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
