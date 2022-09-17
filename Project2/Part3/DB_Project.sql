Create Table Staff
(
StaffID Varchar(10) Primary Key,
FirstName CHAR(20)NOT NULL,
LastName CHAR(20) NOT NULL,
StaffType Char(10) NOT NULL,
JoinedDate Date NOT NULL,
EndDate Date
);
Create Table Inventory
(
ISBN INT,
Title CHAR(20)NOT NULL,
Author CHAR(20)NOT NULL,
BookType Char(10) NOT NULL,
SubjectArea CHAR(30)NOT NULL,
BookDescription Char(200),
PRIMARY KEY(ISBN)
);

Create Table OnlineUser
(
UserID VARCHAR(10) PRIMARY KEY,
StaffId Varchar(10),
Password Varchar(40)NOT NULL,
FOREIGN KEY (StaffId) REFERENCES Staff(StaffID)
);
Create Table Employee
(
EmployeeID VARCHAR(10)PRIMARY KEY,
Photo BLOB,
FirstName CHAR(20)NOT NULL,
LastName CHAR(30)NOT NULL,
SSN INT NOT NULL,
EmployeeType CHAR(20) NOT NULL,
OtherMail VARCHAR(40)NOT NULL,
CampusMail VARCHAR(40)NOT NULL,
Phone INT NOT NULL,
JoinedDate Date NOT NULL,
EndDate Date
);

Create Table Visitor  
(
VisitorID Varchar(10)PRIMARY KEY,
CheckIN Date NOT NULL,
Checkout Date NOT NULL
);

Create Table Guest
(
PassID Varchar(10) PRIMARY KEY,
FristName CHAR(20) NOT NULL,
LastName CHAR(20)NOT NULL,
Phone INT NOT NULL,
GeneratedDate DATE NOT NULL,
ExpireDate Date NOT NULL
);


Create TABLE Member
(
MemberId Varchar(10) PRIMARY KEY,
FirstName CHAR(20) NOT NULL,
LastName CHAR(20) NOT NULL,
Photo BLOB,
MemberType Char(10)NOT NULL,
Phone INT,
HomeMail VARCHAR(40),
CampusMail VARCHAR(40),
GenerationDate DATE,
NoticeDate DATE,
EndDate DATE,
EmployeeId Varchar(10),
FOREIGN KEY(EmployeeId)REFERENCES Employee(EmployeeID)
);

Create Table Dependent
(
DependentI  Varchar(10)PRIMARY KEY,
FirstName Char(20)NOT NULL,
LastName CHAR(20) NOT NULL,
Relation CHAR(10),
MemberId VARCHAR(10) NOT NULL,
FOREIGN KEY (MemberId) REFERENCES MEMBER(MemberId)
);

Create Table Mainatins
(
StaffId Varchar(10),
BookId Int,
BookTitle Char(20),
BookAuthor Char(20),
BookCount Int,
FOREIGN KEY (StaffId) REFERENCES Staff(StaffID),
FOREIGN KEY (BookId) REFERENCES Inventory(ISBN)
);

Create Table BookIssued
(
StaffId Varchar(10),
BookId INT ,
VisitorID VARCHAR(10),
BookTitle CHAR(20),
BookAuthor Char(20),
NoOfBooks Int,
Issuedate Date,
NoticeDate Date,
EndDate Date,
FOREIGN KEY (StaffId) REFERENCES Staff(StaffID),
FOREIGN KEY (BookId) REFERENCES Inventory(ISBN),
FOREIGN KEY (VisitorID) REFERENCES Visitor(VisitorID),
PRIMARY KEY(StaffId,VisitorID,BookId)
);

