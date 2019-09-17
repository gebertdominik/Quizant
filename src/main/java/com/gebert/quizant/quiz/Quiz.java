package com.gebert.quizant.quiz;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(schema = "quiz")
class Quiz extends Audit implements Serializable {

    @Id
    @SequenceGenerator(allocationSize = 1,
            initialValue = 1,
            name = "seqQuiz",
            sequenceName = "PK_SEQ_QUIZ")
    @GeneratedValue( generator = "seqQuiz", strategy = GenerationType.SEQUENCE )
    private Long id;

    private String name;

    @OneToMany(mappedBy = "id", cascade = {CascadeType.ALL} )
    private Set<Question> questions;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn( name = "ID_OWNER" )
    private User owner;

    public Quiz() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }
}

