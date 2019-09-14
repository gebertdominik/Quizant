package com.gebert.quizant.quiz;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class User extends Audit implements Serializable {

    @Id
    @GeneratedValue
    Long id;

    String login;

    String password;

    public User() {
    }
    
}
