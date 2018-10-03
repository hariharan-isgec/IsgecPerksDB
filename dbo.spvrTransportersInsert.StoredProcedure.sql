USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersInsert]
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(100),
  @Address1Line NVarChar(100),
  @Address2Line NVarChar(100),
  @City NVarChar(50),
  @EMailID NVarChar(200),
  @Return_TransporterID NVarChar(9) = null OUTPUT 
  AS
  INSERT [VR_Transporters]
  (
   [TransporterID]
  ,[TransporterName]
  ,[Address1Line]
  ,[Address2Line]
  ,[City]
  ,[EMailID]
  )
  VALUES
  (
   UPPER(@TransporterID)
  ,@TransporterName
  ,@Address1Line
  ,@Address2Line
  ,@City
  ,@EMailID
  )
  SET @Return_TransporterID = @TransporterID
GO
