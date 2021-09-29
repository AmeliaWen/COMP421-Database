with temp (pname, devcost)
as(
        select project.pname, budget/count(devassignments.employeeid) as devcost
        from project, devassignments
        where project.pname = devassignments.pname
        group by project.pname
    )
select temp.pname, temp.devcost
from temp
where temp.devcost = (
    select MAX(devcost)
    from temp
    )
order by pname
;