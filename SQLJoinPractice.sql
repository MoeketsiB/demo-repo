Select top 20 *
from Person p
right join Medical m
On p.ID = m.PersonID



Select top 20 *
from Person p
Left join Medical m
On p.ID = m.PersonID
where Active = 1

Select * from person where rsaidnumber = '8110125711084'

Select * from Medical where Personid = '3D79443B-268D-4D08-BD38-AE7C00F6CA6E'

Select * from medical where ID = '4E2CCA77-4AC4-42FD-9B25-B12500CF18A4'

Select top 5 * from QuestionANswer

Select 
mq.QuestionnaireID,
qa.MedicalID,
qa.CreatedDate
from MedicalQuestionnaire mq
Left join questionnaire q
On mq.QuestionnaireID = q.ID
Join QuestionAnswer qa
on mq.MedicalID = qa.MedicalID

Where mq.MedicalID = '4E2CCA77-4AC4-42FD-9B25-B12500CF18A4' and QuestionnaireID In
(
'0BC2DF77-8A68-4D1D-B9BF-412EA0B10041',
'688851CD-CD01-437B-8C77-62B3F48020CB',
'B4117D9F-CC61-4C57-814A-8EEEBAE9FB5E')



