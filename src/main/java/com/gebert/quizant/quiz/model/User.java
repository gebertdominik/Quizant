package com.gebert.quizant.quiz.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(schema = "quiz")
public class User extends Audit implements Serializable {

    @Id
    @SequenceGenerator(allocationSize = 1,
            initialValue = 1,
            name = "seqUser",
            sequenceName = "PK_SEQ_USER")
    @GeneratedValue( generator = "seqUser", strategy = GenerationType.SEQUENCE )
    Long id;

    String login;

    String password;

    public User() {
    }
    
}
