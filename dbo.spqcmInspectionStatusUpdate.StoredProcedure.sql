USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusUpdate]
  @Original_InspectionStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_InspectionStatus] SET 
   [Description] = @Description
  WHERE
  [InspectionStatusID] = @Original_InspectionStatusID
  SET @RowCount = @@RowCount
GO
