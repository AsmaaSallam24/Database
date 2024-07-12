USE PROD;

CREATE TABLE employee (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO employee (PersonID, FirstName, LastName, Address, City)
VALUES ('1', 'Asmaa', 'Sallam', 'Giza', 'Cairo');



