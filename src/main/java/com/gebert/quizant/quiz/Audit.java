package com.gebert.quizant.quiz;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Source;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;
import java.io.Serializable;
import java.sql.Timestamp;

@MappedSuperclass
public abstract class Audit implements Serializable {

    @CreationTimestamp
    @Source( SourceType.DB )
    @Column(updatable = false )
    Timestamp createDate;

    @UpdateTimestamp
    @Source( SourceType.DB )
    Timestamp updateDate;

    @Version
    private Integer version;
}
