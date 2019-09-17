package com.gebert.quizant.quiz;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(schema = "quiz")
public class Question extends Audit implements Serializable {


    @Id
    @SequenceGenerator(allocationSize = 1,
            initialValue = 1,
            name = "seqQuestion",
            sequenceName = "PK_SEQ_QUESTION")
    @GeneratedValue( generator = "seqQuestion", strategy = GenerationType.SEQUENCE )
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
