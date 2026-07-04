select * from sys.schemas where name in (
  'hr','attendance','leave_management','payroll','security','audit','staging','reporting'
)
order by schema_id