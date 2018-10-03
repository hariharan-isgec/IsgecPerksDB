USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectContactsInsert]
  @ProjectID NVarChar(6),
  @CardNo NVarChar(8),
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
  INSERT [IDM_ProjectContacts]
  (
   [ProjectID]
  ,[CardNo]
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
   UPPER(@ProjectID)
  ,@CardNo
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
