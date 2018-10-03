USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersInsert]
  @CustomerID NVarChar(6),
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @Address1 NVarChar(50),
  @Address2 NVarChar(50),
  @Address3 NVarChar(50),
  @Address4 NVarChar(50),
  @ToEMailID NVarChar(250),
  @CCEmailID NVarChar(1000),
  @Return_CustomerID NVarChar(6) = null OUTPUT
  AS
  INSERT [DCM_Customers]
  (
   [CustomerID]
  ,[ProjectID]
  ,[Description]
  ,[Address1]
  ,[Address2]
  ,[Address3]
  ,[Address4]
  ,[ToEMailID]
  ,[CCEmailID]
  )
  VALUES
  (
   @CustomerID
  ,@ProjectID
  ,@Description
  ,@Address1
  ,@Address2
  ,@Address3
  ,@Address4
  ,@ToEMailID
  ,@CCEmailID
  )
  SET @Return_CustomerID = @CustomerID
GO
