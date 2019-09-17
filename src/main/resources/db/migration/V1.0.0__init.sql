
CREATE SCHEMA IF NOT EXISTS "QUIZ";
CREATE SEQUENCE "QUIZ"."PK_SEQ_QUIZ" START WITH 1;
CREATE SEQUENCE "QUIZ"."PK_SEQ_USER" START WITH 1;
CREATE SEQUENCE "QUIZ"."PK_SEQ_ANSWER" START WITH 1;
CREATE SEQUENCE "QUIZ"."PK_SEQ_ATTEMPT" START WITH 1;
CREATE SEQUENCE "QUIZ"."PK_SEQ_QUESTION" START WITH 1;

CREATE MEMORY TABLE "QUIZ"."ANSWER"(
                                         "ID" BIGINT NOT NULL,
                                         "CREATE_DATE" TIMESTAMP,
                                         "UPDATE_DATE" TIMESTAMP,
                                         "VERSION" INTEGER,
                                         "ANSWER_TEXT" VARCHAR(255),
                                         "POINTS" DOUBLE NOT NULL,
                                         "ID_QUESTION" BIGINT
);
ALTER TABLE "QUIZ"."ANSWER" ADD CONSTRAINT "QUIZ"."PK_ANSWER" PRIMARY KEY("ID");

CREATE MEMORY TABLE "QUIZ"."ATTEMPT"(
                                          "ID" BIGINT NOT NULL,
                                          "CREATE_DATE" TIMESTAMP,
                                          "UPDATE_DATE" TIMESTAMP,
                                          "VERSION" INTEGER,
                                          "USERNAME" VARCHAR(255),
                                          "ID_QUIZ" BIGINT
);
ALTER TABLE "QUIZ"."ATTEMPT" ADD CONSTRAINT "QUIZ"."PK_ATTEMPT" PRIMARY KEY("ID");

CREATE MEMORY TABLE "QUIZ"."QUESTION"(
                                           "ID" BIGINT NOT NULL,
                                           "CREATE_DATE" TIMESTAMP,
                                           "UPDATE_DATE" TIMESTAMP,
                                           "VERSION" INTEGER,
                                           "QUESTION_TEXT" VARCHAR(255),
                                           "ID_QUIZ" BIGINT
);
ALTER TABLE "QUIZ"."QUESTION" ADD CONSTRAINT "QUIZ"."PK_QUESTION" PRIMARY KEY("ID");

CREATE MEMORY TABLE "QUIZ"."QUIZ"(
                                       "ID" BIGINT NOT NULL,
                                       "CREATE_DATE" TIMESTAMP,
                                       "UPDATE_DATE" TIMESTAMP,
                                       "VERSION" INTEGER,
                                       "NAME" VARCHAR(255),
                                       "ID_OWNER" BIGINT
);
ALTER TABLE "QUIZ"."QUIZ" ADD CONSTRAINT "QUIZ"."PK_QUIZ" PRIMARY KEY("ID");

CREATE MEMORY TABLE "QUIZ"."USER"(
                                       "ID" BIGINT NOT NULL,
                                       "CREATE_DATE" TIMESTAMP,
                                       "UPDATE_DATE" TIMESTAMP,
                                       "VERSION" INTEGER,
                                       "LOGIN" VARCHAR(255),
                                       "PASSWORD" VARCHAR(255)
);
ALTER TABLE "QUIZ"."USER" ADD CONSTRAINT "QUIZ"."PK_USER" PRIMARY KEY("ID");

ALTER TABLE "QUIZ"."ANSWER" ADD CONSTRAINT "QUIZ"."FKRBM8PWEYS4S5FD0K18950P7Y0" FOREIGN KEY("ID") REFERENCES "QUIZ"."QUESTION"("ID") NOCHECK;
ALTER TABLE "QUIZ"."QUESTION" ADD CONSTRAINT "QUIZ"."FKFNAI5AI4ULK4URWWWCRMVT5NL" FOREIGN KEY("ID") REFERENCES "QUIZ"."QUIZ"("ID") NOCHECK;
ALTER TABLE "QUIZ"."QUESTION" ADD CONSTRAINT "QUIZ"."FKVNP1U9PSTHBLQ5S0V4G49B73" FOREIGN KEY("ID_QUIZ") REFERENCES "QUIZ"."QUIZ"("ID") NOCHECK;
ALTER TABLE "QUIZ"."ANSWER" ADD CONSTRAINT "QUIZ"."FKCO1PKCHPEDFPV4R4V3NKYXSX3" FOREIGN KEY("ID_QUESTION") REFERENCES "QUIZ"."QUESTION"("ID") NOCHECK;
ALTER TABLE "QUIZ"."ATTEMPT" ADD CONSTRAINT "QUIZ"."FKOPNCAG83FHMTQDRDHPYUKKQOI" FOREIGN KEY("ID_QUIZ") REFERENCES "QUIZ"."QUIZ"("ID") NOCHECK;
ALTER TABLE "QUIZ"."QUIZ" ADD CONSTRAINT "QUIZ"."FKCE022FJFDPUQ3MNM29EAMASUM" FOREIGN KEY("ID_OWNER") REFERENCES "QUIZ"."USER"("ID") NOCHECK;