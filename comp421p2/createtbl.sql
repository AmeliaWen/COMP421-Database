-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
create table Category (
    cname char(200) not null ,
    pLevel integer,
    primary key (cname)
);
create table Person (
    HIN char(20) not null ,
    name char(20),
    dateOfBirth DATE,
    gender char(20),
    phone char(20),
    cname char(200) NOT NULL,
    regDate DATE,
    city char(20),
    streetAddress char(100),
    postalcd char(10),
    primary key (HIN),
    foreign key (cname) references Category (cname)
);
create table Hospital(
    locname char(20) not null,
    lcity char (20),
    lpostalcd char (20),
    lstreetAddress char(100),
    primary key (locname)
);
create table VaccineLocation (
    lname char (20) not null ,
    lcity char(20),
    lpostalcd char (20),
    lstreetAddress char (100),
    primary key (lname)
);
create table Nurse(
    NLN char(20) not null ,
    nursename char(20),
    locname char(30),
    primary key (NLN),
    foreign key (locname) references Hospital (locname)
);
create table VaccineLocPerDay (
    vacdate DATE not null ,
    lname char(20) not null ,
    primary key (vacdate, lname),
    foreign key (lname) references VaccineLocation(lname)
);
create table Slot (
    vslot char(10) not null ,
    vtime TIME not null ,
    vacdate DATE not null ,
    lname char(20) not null ,
    primary key (vslot, vtime, vacdate, lname),
    foreign key (vacdate, lname) references VaccineLocPerDay (vacdate, lname)
);
create table Vaccine(
    vname char(30) not null ,
    waitingPeriod char(20),
    numdoses integer,
    primary key (vname)
);
create table VaccineBatch (
    numvails integer,
    expdate DATE,
    bnumber char(20) not null ,
    manudate DATE,
    vname char (30) not null ,
    primary key (vname, bnumber),
    foreign key (vname) references Vaccine(vname)
);
create table Vail
(
    vnum    char(20) not null,
    bnumber char(20) not null,
    vname   char(30) not null,
    vslot   char(20) not null,
    vtime   TIME not null,
    vacdate DATE not null,
    lname   char(20) not null,
    primary key (vnum, bnumber, vname),
    foreign key (bnumber, vname) references VaccineBatch (bnumber, vname),
    foreign key (vslot, vtime, vacdate, lname) references Slot (vslot, vtime, vacdate, lname)
)
;
create table nurseAssignments (
    NLN char (20) not null ,
    vacdate DATE not null ,
    lname char(20) not null ,
    primary key (NLN, vacdate, lname),
    foreign key (NLN)references Nurse(NLN),
    foreign key (vacdate, lname) references VaccineLocPerDay (vacdate, lname)
);
create table personAllocation (
    alloc_date DATE,
    HIN char(20) not null ,
    vslot char(20) not null ,
    vtime TIME not null ,
    vacdate DATE not null ,
    lname char(20) not null ,
    primary key (HIN, vslot, vtime, vacdate, lname),
    foreign key (HIN) references Person(HIN),
    foreign key (vslot, vtime, vacdate, lname) references Slot(vslot, vtime, vacdate, lname)
);
create table batchStorage (
    bnumber char(20) not null ,
    lname char(20) not null ,
    vname char (30) not null ,
    sentDate DATE,
    primary key (bnumber, lname, vname),
    foreign key (lname) references VaccineLocation (lname),
    foreign key (vname, bnumber) references VaccineBatch (vname, bnumber)
);


