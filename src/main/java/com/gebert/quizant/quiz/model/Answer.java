package com.gebert.quizant.quiz.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(schema = "quiz")
public class Answer extends Audit implements Serializable {

    @Id
    @SequenceGenerator(allocationSize = 1,
            initialValue = 1,
            name = "seqAnswer",
            sequenceName = "PK_SEQ_ANSWER")
    @GeneratedValue( generator = "seqAnswer", strategy = GenerationType.SEQUENCE )
    private Long id;

    private String answerText;

    private double points;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn( name = "ID_QUESTION" )
    private Question question;

    public Answer() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }

    public double getPoints() {
        return points;
    }

    public void setPoints(double points) {
        this.points = points;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
