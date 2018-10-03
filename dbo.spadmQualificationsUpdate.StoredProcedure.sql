USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQualificationsUpdate]
  @Original_QualificationID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Qualifications] SET 
   [Description] = @Description
  WHERE
  [QualificationID] = @Original_QualificationID
  SET @RowCount = @@RowCount
GO
