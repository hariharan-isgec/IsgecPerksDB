USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomerContactsInsert]
  @CustomerID NVarChar(6),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @Remarks NVarChar(250),
  @CCEmailID NVarChar(250),
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [IDM_CustomerContacts]
  (
   [CustomerID]
  ,[ContactPerson]
  ,[EmailID]
  ,[ContactNo]
  ,[Address1]
  ,[Address2]
  ,[Address3]
  ,[Address4]
  ,[Remarks]
  ,[CCEmailID]
  )
  VALUES
  (
   UPPER(@CustomerID)
  ,@ContactPerson
  ,@EmailID
  ,@ContactNo
  ,@Address1
  ,@Address2
  ,@Address3
  ,@Address4
  ,@Remarks
  ,@CCEmailID
  )
  SET @Return_SerialNo = Scope_Identity()
GO
