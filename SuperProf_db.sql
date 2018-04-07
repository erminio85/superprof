CREATE DATABASE SuperProf;

USE SuperProf;

CREATE TABLE 'USERS' (
  'user_id'       INT NOT NULL AUTO_INCREMENT UNIQUE,
  'name'          VARCHAR(20) NOT NULL,
  'surname'       VARCHAR(20) NOT NULL,
  'birth'         DATE NOT NULL,
  'gender'        ENUM('M','F') NULL,
  'email'         VARCHAR(40) NOT NULL,
  'password'      VARCHAR(20) NOT NULL,
  'type'          INT NOT NULL,
  'photo'         BLOB NULL,
  'Description'   CLOB NULL,
  PRIMARY KEY ('user_id'))
ENGINE = 'InnoDB';

CREATE TABLE  'PROF' (
  'prof_id'       INT NOT NULL,
  'subjects'      VARCHAR(20) NULL,
  INDEX newPROF(prof_id),
  PRIMARY KEY ('prof_id')
  FOREIGN KEY ('prof_id') REFERENCES 'USERS'('user_id'))
ENGINE = 'InnoDB';

CREATE TABLE  'STUDENTS' (
  'student_id'    INT NOT NULL,
  'subjects'      VARCHAR(20) NULL,
  'school'        VARCHAR(20) NULL,
  INDEX newSTUDENTS(student_id),
  PRIMARY KEY ('student_id')
  FOREIGN KEY ('student_id') REFERENCES 'USERS'('user_id'))
ENGINE = 'InnoDB';

CREATE TABLE  'QUESTIONS' (
 'student_id'     INT NOT NULL,
 'question_id'    INT NOT NULL AUTO_INCREMENT UNIQUE,
 'title'          VARCHAR(20) NULL,
 'body'           CLOB NULL,
 INDEX newQUESTIONS(student_id),
 PRIMARY KEY ('question_id')
 FOREIGN KEY ('student_id') REFERENCES 'STUDENTS'('user_id'))
ENGINE = 'InnoDB';

CREATE TABLE  'ANSWERS' (
 'prof_id'        INT NOT NULL,
 'answer_id'      INT NOT NULL AUTO_INCREMENT UNIQUE,
 'body'           CLOB NULL,
 INDEX newANSWERS(prof_id),
 PRIMARY KEY ('answer_id')
 FOREIGN KEY ('prof_id') REFERENCES 'PROF'('user_id'))
ENGINE = 'InnoDB';

CREATE TABLE  'SUBJECTS' (
 'subjects_name'   VARCHAR(20) NULL,
 PRIMARY KEY ('subjects')
ENGINE = 'InnoDB';

CREATE TABLE 'STUDY'(
  'student_id'       INT NOT NULL,
  'subject_name'  VARCHAR(20) NULL,
  INDEX newID(student_id),
  INDEX newID(subject_name),
  PRIMARY KEY ('student_id','subject_name')
  FOREIGN KEY ('student_id') REFERENCES 'STUDENTS'('user_id'))
  FOREIGN KEY ('subject_name') REFERENCES 'SUBJECTS'('subject_name'))
 ENGINE = 'InnoDB';

CREATE TABLE 'TEACHES'(
  'prof_id'       INT NOT NULL,
  'subject_name'  VARCHAR(20) NULL,
  INDEX newID(prof_id),
  INDEX newID(subject_name),
  PRIMARY KEY ('prof_id','subject_name')
  FOREIGN KEY ('prof_id') REFERENCES 'STUDENTS'('user_id'))
  FOREIGN KEY ('subject_name') REFERENCES 'SUBJECTS'('subject_name'))
 ENGINE = 'InnoDB';
