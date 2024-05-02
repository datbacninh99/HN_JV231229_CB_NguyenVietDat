CREATE DATABASE IF NOT EXISTS QuanLyDiemThi;
USE QuanLyDiemThi;

CREATE TABLE Student
(
    studentId   VARCHAR(4)   NOT NULL PRIMARY KEY,
    studentName VARCHAR(100) NOT NULL,
    birthday    DATE         NOT NULL,
    gender      BIT(1)       NOT NULL,
    address     TEXT         NOT NULL,
    phoneNumber VARCHAR(45)
);

CREATE TABLE Subject
(
    subjectId   VARCHAR(4)  NOT NULL PRIMARY KEY,
    subjectName VARCHAR(45) NOT NULL,
    priority    INT(11)     NOT NULL
);

CREATE TABLE Mark
(
    subjectId VARCHAR(4) NOT NULL,
    studentId VARCHAR(4) NOT NULL,
    point     INT(11)    NOT NULL
);

ALTER TABLE Mark
    ADD FOREIGN KEY (subjectId) REFERENCES Subject (subjectId),
    ADD FOREIGN KEY (studentId) REFERENCES Student (studentId);