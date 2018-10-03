USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsHUpdate]
  @Original_FinYear NVarChar(4), 
  @Original_CardNo NVarChar(8), 
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @FormStatusID NVarChar(30),
  @SubmittedOn DateTime,
  @ApprovedOn DateTime,
  @ApprovedBy NVarChar(8),
  @SubmittedToHROn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMS_FormsH] SET 
   [FinYear] = @FinYear
  ,[CardNo] = @CardNo
  ,[FormStatusID] = @FormStatusID
  ,[SubmittedOn] = @SubmittedOn
  ,[ApprovedOn] = @ApprovedOn
  ,[ApprovedBy] = @ApprovedBy
  ,[SubmittedToHROn] = @SubmittedToHROn
  WHERE
  [FinYear] = @Original_FinYear
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
