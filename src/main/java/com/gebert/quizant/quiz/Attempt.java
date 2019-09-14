package com.gebert.quizant.quiz;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Attempt extends Audit implements Serializable {


    @Id
    @GeneratedValue
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
