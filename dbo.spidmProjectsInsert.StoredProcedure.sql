USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectsInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @CustomerID NVarChar(6),
  @CustomerOrderReference NVarChar(50),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @ToEMailID NVarChar(250),
  @CCEmailID NVarChar(250),
  @Return_ProjectID NVarChar(6) = null OUTPUT
  AS
  INSERT [IDM_Projects]
  (
   [ProjectID]
  ,[Description]
  ,[CustomerID]
  ,[CustomerOrderReference]
  ,[ContactPerson]
  ,[EmailID]
  ,[ContactNo]
  ,[Address1]
  ,[Address2]
  ,[Address3]
  ,[Address4]
  ,[ToEMailID]
  ,[CCEmailID]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@CustomerID
  ,@CustomerOrderReference
  ,@ContactPerson
  ,@EmailID
  ,@ContactNo
  ,@Address1
  ,@Address2
  ,@Address3
  ,@Address4
  ,@ToEMailID
  ,@CCEmailID
  )
  SET @Return_ProjectID = @ProjectID
GO
