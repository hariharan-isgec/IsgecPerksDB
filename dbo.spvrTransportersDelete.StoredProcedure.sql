USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersDelete]
  @Original_TransporterID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_Transporters]
  WHERE
  [VR_Transporters].[TransporterID] = @Original_TransporterID
  SET @RowCount = @@RowCount
GO
