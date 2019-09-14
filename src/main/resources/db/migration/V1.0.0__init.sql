CREATE MEMORY TABLE "PUBLIC"."ANSWER"(
                                         "ID" BIGINT NOT NULL,
                                         "CREATE_DATE" TIMESTAMP,
                                         "UPDATE_DATE" TIMESTAMP,
                                         "VERSION" INTEGER,
                                         "ANSWER_TEXT" VARCHAR(255),
                                         "POINTS" DOUBLE NOT NULL,
                                         "ID_QUESTION" BIGINT
);
ALTER TABLE "PUBLIC"."ANSWER" ADD CONSTRAINT "PUBLIC"."PK_ANSWER" PRIMARY KEY("ID");

CREATE MEMORY TABLE "PUBLIC"."ATTEMPT"(
                                          "ID" BIGINT NOT NULL,
                                          "CREATE_DATE" TIMESTAMP,
                                          "UPDATE_DATE" TIMESTAMP,
                                          "VERSION" INTEGER,
                                          "USERNAME" VARCHAR(255),
                                          "ID_QUIZ" BIGINT
);
ALTER TABLE "PUBLIC"."ATTEMPT" ADD CONSTRAINT "PUBLIC"."PK_ATTEMPT" PRIMARY KEY("ID");

CREATE MEMORY TABLE "PUBLIC"."QUESTION"(
                                           "ID" BIGINT NOT NULL,
                                           "CREATE_DATE" TIMESTAMP,
                                           "UPDATE_DATE" TIMESTAMP,
                                           "VERSION" INTEGER,
                                           "QUESTION_TEXT" VARCHAR(255),
                                           "ID_QUIZ" BIGINT
);
ALTER TABLE "PUBLIC"."QUESTION" ADD CONSTRAINT "PUBLIC"."PK_QUESTION" PRIMARY KEY("ID");

CREATE MEMORY TABLE "PUBLIC"."QUIZ"(
                                       "ID" BIGINT NOT NULL,
                                       "CREATE_DATE" TIMESTAMP,
                                       "UPDATE_DATE" TIMESTAMP,
                                       "VERSION" INTEGER,
                                       "NAME" VARCHAR(255),
                                       "ID_OWNER" BIGINT
);
ALTER TABLE "PUBLIC"."QUIZ" ADD CONSTRAINT "PUBLIC"."PK_QUIZ" PRIMARY KEY("ID");

CREATE MEMORY TABLE "PUBLIC"."USER"(
                                       "ID" BIGINT NOT NULL,
                                       "CREATE_DATE" TIMESTAMP,
                                       "UPDATE_DATE" TIMESTAMP,
                                       "VERSION" INTEGER,
                                       "LOGIN" VARCHAR(255),
                                       "PASSWORD" VARCHAR(255)
);
ALTER TABLE "PUBLIC"."USER" ADD CONSTRAINT "PUBLIC"."PK_USER" PRIMARY KEY("ID");

ALTER TABLE "PUBLIC"."ANSWER" ADD CONSTRAINT "PUBLIC"."FKRBM8PWEYS4S5FD0K18950P7Y0" FOREIGN KEY("ID") REFERENCES "PUBLIC"."QUESTION"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."QUESTION" ADD CONSTRAINT "PUBLIC"."FKFNAI5AI4ULK4URWWWCRMVT5NL" FOREIGN KEY("ID") REFERENCES "PUBLIC"."QUIZ"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."QUESTION" ADD CONSTRAINT "PUBLIC"."FKVNP1U9PSTHBLQ5S0V4G49B73" FOREIGN KEY("ID_QUIZ") REFERENCES "PUBLIC"."QUIZ"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."ANSWER" ADD CONSTRAINT "PUBLIC"."FKCO1PKCHPEDFPV4R4V3NKYXSX3" FOREIGN KEY("ID_QUESTION") REFERENCES "PUBLIC"."QUESTION"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."ATTEMPT" ADD CONSTRAINT "PUBLIC"."FKOPNCAG83FHMTQDRDHPYUKKQOI" FOREIGN KEY("ID_QUIZ") REFERENCES "PUBLIC"."QUIZ"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."QUIZ" ADD CONSTRAINT "PUBLIC"."FKCE022FJFDPUQ3MNM29EAMASUM" FOREIGN KEY("ID_OWNER") REFERENCES "PUBLIC"."USER"("ID") NOCHECK;