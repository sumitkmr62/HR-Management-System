select * from sys.schemas where name in (
  'hr','attendance','leave_management','payroll','security','audit','staging','reporting'
)
order by schema_id

--delete from sys.schemas where name = 'hr'
--,'attendance','leave_management','payroll','security','audit','staging','reporting')

drop schema hr;
drop schema attendance;
drop schema leave_management;
drop schema payroll;
drop schema [security];
drop schema [audit];
drop schema staging;
drop schema reporting;

use HRManagementSystem;
select * from sys.schemas WHERE name = 'hr' in ('hr','attendance','leave_management','payroll','security','audit','staging','reporting')

select * from hr.Department;