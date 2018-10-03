USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmQualificationsUpdate]
  @Description NVarChar(50),
  @Original_QualificationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Qualifications] SET 
   [Description] = @Description
  WHERE
  [QualificationID] = @Original_QualificationID
  SET @RowCount = @@RowCount
GO
