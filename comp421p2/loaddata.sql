-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
INSERT INTO Category (cname,pLevel) VALUES ('Health care workers','1');
INSERT INTO Category (cname,pLevel) VALUES ('Elderly','1');
INSERT INTO Category (cname,pLevel) VALUES ('Teachers','2');
INSERT INTO Category (cname,pLevel) VALUES ('Children below 10','2');
INSERT INTO Category (cname,pLevel) VALUES ('Immunologically Compromised','1');
INSERT INTO Category (cname,pLevel) VALUES ('physical proximity to first priority','2');
INSERT INTO Category (cname,pLevel) VALUES ('physical proximity to second priority','3');
INSERT INTO Category (cname,pLevel) VALUES ('Essential Service Worker','3');
INSERT INTO Category (cname,pLevel) VALUES ('Everybody else','4');

INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('2401562303','Jimmie Mendoza','2000-10-27','Male','7398429402','Everybody else','2020-01-01','Montreal','287 Albany St. ','L4A3S8');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('5558344135','Natalie Parks','1999-01-01','Female','4642166149','physical proximity to second priority','2020-01-02','Montreal','7938 Temple Rd. ','E7M8H5');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('9981054414','Lynne Curry','1998-04-07','Female','3063317061','Immunologically Compromised','2020-03-30','Montreal','64 Stillwater Lane ','P2N9Y0');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('8164350380','Dana Colon','1988-09-20','Female','2414352343','Essential Service Worker','2020-05-02','Montreal','917 Bradford Ave. ','G0A6H6');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('6334043733','Sonja Wood','2018-05-24','Female','9462941191','Children below 10','2020-04-02','Montreal','7988 Poor House Ave. ','N7G7V6');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('3917587088','Jesus Poole','1949-02-02','Male','7153019183','Elderly','2020-09-20','Quebec','75 Squaw Creek Road','K7V9H1');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('5025429412','Guadalupe Wallace','1982-08-21','Male','4983136624','Essential Service Worker','2020-08-11','Quebec','347 Oakwood Drive ','K6T9J8');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('7925598682','Nellie Pena','1977-11-30','Female','6964876608','Teachers','2020-08-11','Quebec','260 Elm Drive ','L9S2M6');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('4268703448','Monica Roberts','1996-03-01','Female','5142234567','Health care workers','2020-09-05','Quebec','744 Pin Oak Street ','G7A7L9');
INSERT INTO Person (HIN,name,dateOfBirth,gender,phone,cname,regDate,city,streetAddress,postalcd) VALUES ('3809069796','Jane Doe','1966-06-06','Male','5142675678','Everybody else','2020-11-01','Quebec','9167 Manchester Lane','N1M5S6');

INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalA','Montreal','N1M123','90 Arrowhead Street ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalB','Montreal','L4A123','51 NW. River Drive ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalC','Montreal','E7M123','161 Thorne Street ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalD','Montreal','P2N123','426 Glenlake Dr. ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalE','Montreal','G0A123','163 Central Ave. ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalF','Quebec','N7G123','Lady Lake');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalG','Quebec','K7V123','54 Beacon St. ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalH','Quebec','K6T123','566 Constitution Drive ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalI','Quebec','L9S123','36 N. Rockland Ave. ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('HospitalJ','Quebec','G7A123','395 Maple Street ');
INSERT INTO Hospital (locname,lcity,lpostalcd,lstreetAddress) VALUES ('Jewish General','Montreal ','L4A456','Ashton Loan');

INSERT INTO Nurse (NLN,nursename,locname) VALUES ('1832014183','Sidney Wise','HospitalA');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('1938735284','Loretta Curry','HospitalA');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('8514592385','Patrick James','HospitalA');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('4470014731','Tara Gibbs','HospitalD');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('3302838507','Maria Perkins','HospitalD');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('5958242947','Silvia Higgins','HospitalD');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('864061152','Sheila Goodwin','HospitalI');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('5670572612','Faye Parker','Jewish General');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('3152764765','Mack Brady','Jewish General');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('3359852020','Victoria Edwards','Jewish General');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('12345678','Mike Brady','Jewish General');
INSERT INTO Nurse (NLN,nursename,locname) VALUES ('87654321','Victory Edwards','Jewish General');

INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationA','Montreal ','N1M456',' Angleton Green');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('Jewish General','Montreal ','L4A456','Ashton Loan');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationC','Montreal ','E7M456','Audley Town');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationD','Montreal ','P2N456','Autumn Down');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationE','Montreal ','G0A456','Abrams Green');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationF','Quebec','N7G456','Anchor Celyn');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationG','Quebec','K7V456','Allensgreen');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationH','Quebec','K6T456','Alwain Green');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationI','Quebec','L9S456','Anson Common');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationJ','Quebec','G7A456','Alpine Loan');
INSERT INTO VaccineLocation (lname,lcity,lpostalcd,lstreetAddress) VALUES ('LocationB','Montreal','G7A457','Alpine Loan B');

INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-02-06','LocationA');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-02-01','LocationA');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-02-06','LocationB');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-02-01','LocationB');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-03-20','Jewish General');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-01-01','Jewish General');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-01-02','Jewish General');
INSERT INTO VaccineLocPerDay (vacdate,lname) VALUES ('2021-01-03','Jewish General');

INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('1','13.30.05','2021-02-06','LocationA');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('1','13.30.06','2021-02-06','LocationA');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('2','13.30.07','2021-02-06','LocationA');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('2','13.30.08','2021-03-20','Jewish General');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('3','13.30.09','2021-03-20','Jewish General');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('3','13.30.10','2021-01-01','Jewish General');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('4','13.30.11','2021-01-02','Jewish General');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('4','13.30.12','2021-01-03','Jewish General');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('5','13.30.13','2021-02-06','LocationB');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('5','13.30.14','2021-02-06','LocationB');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('1','13.30.08','2021-03-20','Jewish General');
INSERT INTO Slot (vslot,vtime,vacdate,lname) VALUES ('4','13.30.09','2021-03-20','Jewish General');

INSERT INTO Vaccine (vname,waitingPeriod,numdoses) VALUES ('Pfizer-BioNTech','1month','2');
INSERT INTO Vaccine (vname,waitingPeriod,numdoses) VALUES ('Moderna','1month','2');

INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('12','2028-01-01','A','2020-12-01','Pfizer-BioNTech');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('12','2028-01-02','B ','2020-12-02','Pfizer-BioNTech');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('12','2028-01-03','C','2020-12-03','Pfizer-BioNTech');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('12','2028-01-04','D','2020-12-04','Pfizer-BioNTech');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('12','2028-01-05','E','2020-12-05','Pfizer-BioNTech');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('10','2028-01-06','A','2020-12-06','Moderna');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('10','2028-01-07','B ','2020-12-07','Moderna');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('10','2028-01-08','C','2020-12-08','Moderna');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('10','2028-01-09','D','2020-12-09','Moderna');
INSERT INTO VaccineBatch (numvails,expdate,bnumber,manudate,vname) VALUES ('10','2028-01-10','E','2020-12-10','Moderna');


INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('1','D','Pfizer-BioNTech','1','13.30.05','2021-02-06','LocationA');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('2','D','Pfizer-BioNTech','1','13.30.06','2021-02-06','LocationA');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('3','E','Pfizer-BioNTech','2','13.30.07','2021-02-06','LocationA');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('1','B ','Pfizer-BioNTech','2','13.30.08','2021-03-20','Jewish General');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('2','B ','Pfizer-BioNTech','3','13.30.09','2021-03-20','Jewish General');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('1','C','Pfizer-BioNTech','3','13.30.10','2021-01-01','Jewish General');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('2','C','Pfizer-BioNTech','4','13.30.11','2021-01-02','Jewish General');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('3','C','Pfizer-BioNTech','4','13.30.12','2021-01-03','Jewish General');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('1','A','Moderna','5','13.30.13','2021-02-06','LocationB');
INSERT INTO Vail (vnum,bnumber,vname,vslot,vtime,vacdate,lname) VALUES ('2','A','Moderna','5','13.30.14','2021-02-06','LocationB');

INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('4470014731','2021-03-20','Jewish General');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('4470014731','2021-02-06','LocationB');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('3152764765','2021-02-06','LocationB');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('1938735284','2021-02-06','LocationA');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('8514592385','2021-02-06','LocationA');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('3302838507','2021-03-20','Jewish General');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('5958242947','2021-01-01','Jewish General');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('864061152','2021-01-02','Jewish General');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('5670572612','2021-01-03','Jewish General');
INSERT INTO nurseAssignments (NLN,vacdate,lname) VALUES ('3359852020','2021-02-06','LocationB');

INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-01','3917587088','3','13.30.10','2021-01-01','Jewish General');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-02','5025429412','4','13.30.11','2021-01-02','Jewish General');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-03','7925598682','4','13.30.12','2021-01-03','Jewish General');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-04','3809069796','1','13.30.05','2021-02-06','LocationA');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-05','5558344135','1','13.30.06','2021-02-06','LocationA');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-06','9981054414','2','13.30.07','2021-02-06','LocationA');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-07','8164350380','2','13.30.08','2021-03-20','Jewish General');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-08','7925598682','3','13.30.09','2021-03-20','Jewish General');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-09','4268703448','5','13.30.13','2021-02-06','LocationB');
INSERT INTO personAllocation (alloc_date,HIN,vslot,vtime,vacdate,lname) VALUES ('2020-11-10','2401562303','5','13.30.14','2021-02-06','LocationB');

INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-15','LocationA','Pfizer-BioNTech','D');
INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-16','LocationA','Pfizer-BioNTech','E');
INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-18','Jewish General','Pfizer-BioNTech','B ');
INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-19','Jewish General','Pfizer-BioNTech','A ');
INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-20','Jewish General','Pfizer-BioNTech','C');
INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-23','LocationB','Moderna','A');
INSERT INTO batchStorage (sentDate,lname,vname,bnumber) VALUES ('2020-11-24','LocationB','Moderna','B');

