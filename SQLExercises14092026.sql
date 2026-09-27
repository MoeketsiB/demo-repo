Select * from person where rsaidnumber = '9002225864088'
--1--
Select * from medical where
MedicalDate between '2023-01-01' and '2023-03-31' order by medicaldate desc

--2--
Select personid,
MedicalExamTypeID,
MedicalDate,
MedicalCentreID,
FitnessStatus,
ValidUntilDate,
OutcomeID
from Medical

--3--
Select personid,
MedicalExamTypeID,
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
MedicalCentreID,
FitnessStatus,
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical

--4--
Select p.ExternalCode,
P.Firstnames,
p.Surname,
MedicalExamTypeID,
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
MedicalCentreID,
FitnessStatus,
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical m
Join Person p
On P.Id = m.PersonID

--5--
Select p.ExternalCode,
P.Firstnames,
p.Surname,
me.Name As MedicalExamtype, 
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
MedicalCentreID,
FitnessStatus,
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical m
Join Person p
On P.Id = m.PersonID
Join MedicalExamtype me
on m.MedicalExamTypeID = me.ID

--6--
Select p.ExternalCode,
P.Firstnames,
p.Surname,
me.Name As MedicalExamtype, 
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
mc. Name As MedicalCentreID,
FitnessStatus,
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical m
Join Person p
On P.Id = m.PersonID
Join MedicalExamtype me
on m.MedicalExamTypeID = me.ID
Join MedicalCentre mc
on m.MedicalCentreID = mc.ID

--7--
Select * from Medical

Select p.ExternalCode,
P.Firstnames,
p.Surname,
me.Name As MedicalExamtype, 
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
mc. Name As MedicalCentreID,
FitnessStatus,
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical m
Join Person p
On P.Id = m.PersonID
Join MedicalExamtype me
on m.MedicalExamTypeID = me.ID
Join MedicalCentre mc
on m.MedicalCentreID = mc.ID

--8--
--Select * from Medicalexamtype
Select p.ExternalCode,
P.Firstnames,
p.Surname,
me.Name As MedicalExamtype, 
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
mc. Name As MedicalCentreID,
FitnessStatus,
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical m
Join Person p
On P.Id = m.PersonID
Join MedicalExamtype me
on m.MedicalExamTypeID = me.ID
Join MedicalCentre mc
on m.MedicalCentreID = mc.ID
Where me.Usage = 1

--9--
Select p.ExternalCode,
P.Firstnames,
p.Surname,
me.Name As MedicalExamtype, 
Format(MedicalDate, 'yyyy-mm-dd') As Medicaldate,
mc. Name As MedicalCentreID,
m.FitnessStatus,
CASE
        WHEN m.FitnessStatus = 0 THEN 'Open'
        WHEN m.FitnessStatus = 1 THEN 'Closed'
        Else 'Unknown'
  
End As Status, 
Format(ValidUntilDate, 'yyyy-mm-dd') As ValidUntidate,
OutcomeID
from Medical m
Join Person p
On P.Id = m.PersonID
Join MedicalExamtype me
on m.MedicalExamTypeID = me.ID
Join MedicalCentre mc
on m.MedicalCentreID = mc.ID
Where me.Usage = 1
And m.FitnessStatus IN (0, 1)
Order by FitnessStatus desc

--10--
--Select * from MedicalExamTypeOutcome

Select met.Name As FitnessStatus
from MedicalExamTypeOutcome met
Left Join Medical m
On met.id = m.OutcomeID

SELECT 
    m.*, 
    met.Name AS FitnessStatus
FROM MedicalExamTypeOutcome met
LEFT JOIN Medical m ON met.id = m.OutcomeID;


SELECT 
    m.ID, 
    m.PersonID, 
    m.MedicalCentreID, 
    m.MedicalExamTypeID, 
    m.OccupationID, 
    m.OREPID, 
    m.MedicalDate, 
    m.FitnessStatus, 
    m.Status, 
    m.ValidUntilDate, 
    m.Comments, 
    m.ConfidentialComments, 
    m.CreatedByID, 
    m.CreatedDate, 
    m.ModifiedByID, 
    m.ModifiedDate, 
    m.MaxValidUntilDate, 
    m.DependentID, 
    m.MedicalPractitionerID, 
    m.MedicalPractitionerTypeID, 
    m.WrittenComments, 
    m.WrittenConfidentialComments, 
    m.PersonMedicalAidID, 
    m.BusinessUnitID, 
    m.MineID, 
    m.MedicalExamReasonID, 
    m.MedicalExamReasonText, 
    m.BookingID, 
    m.CompanyID, 
    m.Number, 
    met.Name AS FitnessStatus, -- Replaces OutcomeID with the name
    m.PriorityID
FROM MedicalExamTypeOutcome met
LEFT JOIN Medical m ON met.id = m.OutcomeID;

---11---

Select * from Medicalquestionnaire where id = 'A1C28204-FD8A-406E-8B33-0000579DE02C'

Select * from Questionnaire where description like '%vct%'
SELECT 
    m.*, 
    met.Name AS FitnessStatus,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM MedicalQuestionnaire mq
            INNER JOIN Questionnaire q
                ON mq.QuestionnaireID = q.ID
            WHERE mq.MedicalID = m.ID
              AND q.Description = 'HCTMain'
        ) THEN 'Yes'
        ELSE 'No'
    END AS VCT
FROM Medical m
LEFT JOIN MedicalExamTypeOutcome met
    ON m.OutcomeID = met.ID;

SELECT 
    m.ID,
    m.PersonID,
    m.MedicalCentreID,
    m.MedicalExamTypeID,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM MedicalQuestionnaire mq
            INNER JOIN Questionnaire q ON mq.QuestionnaireID = q.ID
            WHERE mq.MedicalID = m.ID
              AND q.Description = 'HCTMain'
        ) THEN 'Yes' 
        ELSE 'No' 
    END AS VCT,
    m.OccupationID,
    m.OREPID,
    m.MedicalDate,
    met.Name AS FitnessStatus,
    m.Status,
    m.ValidUntilDate,
    m.Comments,
    m.ConfidentialComments,
    m.CreatedByID,
    m.CreatedDate,
    m.ModifiedByID,
    m.ModifiedDate,
    m.MaxValidUntilDate,
    m.DependentID,
    m.MedicalPractitionerID,
    m.MedicalPractitionerTypeID,
    m.WrittenComments,
    m.WrittenConfidentialComments,
    m.PersonMedicalAidID,
    m.BusinessUnitID,
    m.MineID,
    m.MedicalExamReasonID,
    m.MedicalExamReasonText,
    m.BookingID,
    m.CompanyID,
    m.Number,
    met.Name AS OutcomeID,
    m.PriorityID
FROM Medical m
LEFT JOIN MedicalExamTypeOutcome met
    ON m.OutcomeID = met.ID;

----13-----
DECLARE @FromDate DATE = '2020-01-01';
DECLARE @ToDate DATE = '2026-09-22';

SELECT * 
FROM medical (NoLock)
WHERE MedicalDate BETWEEN @FromDate AND @ToDate 
ORDER BY MedicalDate DESC;