Select * from Person where Rsaidnumber = '8110125711084'
select* from medical where personid = '3D79443B-268D-4D08-BD38-AE7C00F6CA6E'

Select 
p.ID AS EmployeeID,
p.RsaIDNumber,
p.Firstnames,
p.Surname,
DATEDIFF(yy, p.Birthdate, GETDATE()) - CASE WHEN (MONTH(p.Birthdate) > MONTH(GETDATE())) 
OR (MONTH(p.Birthdate) = MONTH(GETDATE()) AND DAY(p.Birthdate) > DAY(GETDATE())) THEN 1 ELSE 0 END AS [Age],
m.ID As MedicalID,
m.MedicalExamTypeID,
m.FitnessStatus,
m.status,
m.MedicalDate,
m.ValidUntilDate
from Medical m
Left Join Person p
On m.personid = p.ID
Where p.RsaIDNumber = '8110125711084'
order by medicaldate desc


---DATEDIFF(YEAR, p.Birthdate, GETDATE()) - 
----CASE WHEN GETDATE() < DATEADD(YEAR, DATEDIFF(YEAR, p.Birthdate, GETDATE()), p.Birthdate) THEN 1 ELSE 0 END AS [Age]

-----(CAST(CONVERT(CHAR(8), GETDATE(), 112) AS INT) - CAST(CONVERT(CHAR(8), p.Birthdate, 112) AS INT)) / 10000 AS [Age]