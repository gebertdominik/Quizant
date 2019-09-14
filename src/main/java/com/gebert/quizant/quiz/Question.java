package com.gebert.quizant.quiz;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Question {


    @Id
    @GeneratedValue
    private Long id;

    private String questionText;

    @OneToMany(mappedBy = "id", cascade = {CascadeType.ALL} )
    private Set<Answer> answers;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn( name = "ID_QUIZ" )
    private Quiz quiz;

    public Question() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }
}
