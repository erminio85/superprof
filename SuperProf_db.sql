CREATE DATABASE SuperProf;

USE SuperProf;

CREATE TABLE USERS (
  user_id			INT NOT NULL AUTO_INCREMENT UNIQUE,
  uname			  VARCHAR(20) NOT NULL,
  surname		  VARCHAR(20) NOT NULL,
  birth				DATE NOT NULL,
  gender			ENUM('M','F') NULL,
  email 			VARCHAR(40) NOT NULL,
  passw 			VARCHAR(20) NOT NULL,
  utype				INT NOT NULL,
  photo       BLOB NULL,
  description VARCHAR(200) NULL,
  PRIMARY KEY (user_id))
  ENGINE = 'InnoDB';

CREATE TABLE  PROF (
  prof_id     INT NOT NULL,
  subjects 		VARCHAR(20) NULL,
  INDEX new_prof (prof_id),
  PRIMARY KEY (prof_id),
  FOREIGN KEY (prof_id) REFERENCES USERS (user_id))
ENGINE = 'InnoDB';

CREATE TABLE  STUDENTS (
  student_id		INT NOT NULL,
  subjects			VARCHAR(20) NULL,
  school			  VARCHAR(20) NULL,
  INDEX new_student (student_id),
  PRIMARY KEY (student_id),
  FOREIGN KEY (student_id) REFERENCES USERS(user_id))
ENGINE = 'InnoDB';

CREATE TABLE  QUESTIONS (
 student_id		  INT NOT NULL,
 question_id    INT NOT NULL AUTO_INCREMENT UNIQUE,
 title					VARCHAR (20) NULL,
 body				    VARCHAR (200) NULL,
 INDEX new_question (student_id),
 PRIMARY KEY (question_id),
 FOREIGN KEY (student_id) REFERENCES STUDENTS (student_id))
ENGINE = 'InnoDB';

CREATE TABLE  ANSWERS (
 prof_id        INT NOT NULL,
 answer_id      INT NOT NULL AUTO_INCREMENT UNIQUE,
 body           VARCHAR (200) NULL,
 INDEX new_answer (prof_id),
 PRIMARY KEY (answer_id),
 FOREIGN KEY (prof_id) REFERENCES PROF(prof_id))
ENGINE = 'InnoDB';

CREATE TABLE  SUBJECTS (
 subjects_name   VARCHAR (20) NOT NULL,
 PRIMARY KEY (subjects_name))
ENGINE = 'InnoDB';

CREATE TABLE STUDY (
  student_id			INT NOT NULL,
  subjects_name  	VARCHAR(20) NOT NULL,
  INDEX new_student_study (student_id),
  INDEX new_study (subjects_name),
  PRIMARY KEY (student_id, subjects_name),
  FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id),
  FOREIGN KEY (subjects_name) REFERENCES SUBJECTS(subjects_name))
 ENGINE = 'InnoDB';

CREATE TABLE TEACHES (
  prof_id       	INT NOT NULL,
  subjects_name  	VARCHAR(20) NOT NULL,
  INDEX  new_prof_teach (prof_id),
  INDEX new_teach (subjects_name),
  PRIMARY KEY (prof_id, subjects_name),
  FOREIGN KEY (prof_id) REFERENCES PROF(prof_id),
  FOREIGN KEY (subjects_name) REFERENCES SUBJECTS(subjects_name))
 ENGINE = 'InnoDB';
