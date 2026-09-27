Use Contacts

Drop Procedure If Exists dbo.SelectContact

Go

Create Procedure dbo.SelectContact

(
@ContactId Int
)
As 

Begin 

Set NoCount On

Select ContactId, FirstName, LastName, DateOfBirth, AllowContactByPhone, CreatedDate
From dbo.Contacts
Where ContactID = @ContactId

Set NoCount Off

End