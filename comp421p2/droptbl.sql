-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.

drop table Person;
drop table Category;
drop table Nurse;
drop table Hospital;
drop table VaccineLocation;
drop table VaccineLocPerDay;
drop table Slot;
drop table Vaccine;
drop table VaccineBatch;
drop table Vail;
drop table nurseAssignments;
drop table personAllocation;
drop table batchStorage;