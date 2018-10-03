USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmCustomersInsert]
  @CustomerID NVarChar(6),
  @Description NVarChar(100),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @ToEMailID NVarChar(250),
  @CCEmailID NVarChar(250),
  @Return_CustomerID NVarChar(6) = null OUTPUT
  AS
  INSERT [IDM_Customers]
  (
   [CustomerID]
  ,[Description]
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
   UPPER(@CustomerID)
  ,@Description
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
  SET @Return_CustomerID = @CustomerID
GO
