--q1
select pname, pstartdate
from project
where ptype = 'internal'
order by pname
;

--q2
select developer.employeeid, ename
from developer, documentauthors
where developer.employeeid = documentauthors.employeeid
  and documentid = 22
order by employeeid
;

--q3
select ename, employeeid
from developer
where employeeid in (
    select employeeid
    from devassignments
    where pname = 'Kodiak'
        except
    select employeeid
    from documentauthors, document
    where documentauthors.documentid = document.documentid
      and pname = 'Kodiak'
)
order by employeeid
;

--q4
select distinct devassignments.pname, asgndate, ptype
from project, devassignments
where devassignments.employeeid= 82102
order by pname
;

--q5
select pname, pstartdate
from project
where pstartdate between '2020-05-01' and '2020-08-31'
order by pstartdate, pname
;

--INSERT INTO devassignments VALUES(93752, 'Snowy', '2021-01-21');
--q6
select ename, employeeid
from developer
where employeeid in (
    select employeeid
    from devassignments, project
    where project.pname = devassignments.pname
      and project.ptype = 'internal'
        except
    select employeeid
    from devassignments, project
    where project.pname = devassignments.pname
      and project.ptype = 'external'
)
order by employeeid
;
--q7
select pname, employeeid
from project, developer
where (pname, employeeid) in (
    select distinct project.pname, employeeid
    from project, document, documentauthors
    where project.pname = document.pname
      and document.documentid = documentauthors.documentid
        except
    select distinct project.pname, employeeid
    from project, devassignments
    where project.pname = devassignments.pname
)
order by pname, employeeid
;
--q8
select distinct pname
from (
         select project.pname, employeeid from
                                              project, document, documentauthors
         where document.documentid = documentauthors.documentid
           and project.pname = document.pname
     ) as temp
where temp.employeeid = 93401
order by pname
;
--q9
select count(distinct pname)
from project
where pstartdate >= '2021-01-01'
;
--q10
select count (distinct pname) as numprojects
from project
where pname in (
    select distinct pname
    from (
             select project.pname, employeeid
             from project, document, documentauthors
             where document.documentid = documentauthors.documentid
               and project.pname = document.pname
         ) as temp
    where temp.employeeid = 93401
)
;
--q11
select pname
from (
         select distinct devassignments.pname, devassignments.employeeid
         from devassignments
     )as temp
group by temp.pname
having count(*) > 2
order by pname
;
-- alternative q11
select pname
from devassignments
group by devassignments.pname
having count(*) > 2
order by pname
;
--q12
select pname
from project
where pname not in (
    select pname
    from devassignments
    group by devassignments.pname
    having count(*) > 2
)
order by pname
;

--INSERT INTO project VALUES('Walleye2', '2021-01-23', 'internal', 12000000);
--q13
select p.pname, count(d.dname) as numdocs
from project p
         left outer join document d on d.pname = p.pname
group by p.pname
order by numdocs desc , p.pname
;
--q14
select project.pname, pstartdate
from project
where pstartdate = (select MIN(pstartdate)
                    from project )
order by pname
;
--q15
select p.pname, p.pstartdate, count(d.employeeid) as numdevs
from project p
         left outer join devassignments d on p.pname = d.pname
where p.pstartdate in (select MAX(pstartdate)
                       from project )
group by p.pname, p.pstartdate
order by pname
;
--q16
select ename, employeeid
from developer
where (employeeid) in (
    (select distinct employeeid
     from project, document, documentauthors
     where project.pname = 'Kodiak'
       and project.pname = document.pname
       and document.documentid = documentauthors.documentid
     union
     select distinct employeeid
     from project, devassignments
     where project.pname = devassignments.pname
       and project.pname = 'Kodiak')
    except (
        select distinct employeeid
        from project, document, documentauthors
        where project.pname = 'Kodiak'
          and project.pname = document.pname
          and document.documentid = documentauthors.documentid
        intersect
        select distinct employeeid
        from project, devassignments
        where project.pname = devassignments.pname
          and project.pname = 'Kodiak')

)
order by employeeid
;
--q17
select pname, budget
from project
where project.budget > (
    select AVG(p.budget)
    from project p
    where p.ptype = 'internal'
)
order by budget desc, pname
;

--q18
with temp3 (pname, devcost)
         as(
        select project.pname, budget/count(devassignments.employeeid) as devcost
        from project, devassignments
        where project.pname = devassignments.pname
        group by project.pname
    )
select temp3.pname, temp3.devcost
from temp3
where temp3.devcost = (
    select MAX(devcost)
    from temp3
)
order by pname
;
