USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersUpdate]
  @Original_TransporterID NVarChar(9), 
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(100),
  @Address1Line NVarChar(100),
  @Address2Line NVarChar(100),
  @City NVarChar(50),
  @EMailID NVarChar(200),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_Transporters] SET 
   [TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[Address1Line] = @Address1Line
  ,[Address2Line] = @Address2Line
  ,[City] = @City
  ,[EMailID] = @EMailID
  WHERE
  [TransporterID] = @Original_TransporterID
  SET @RowCount = @@RowCount
GO
