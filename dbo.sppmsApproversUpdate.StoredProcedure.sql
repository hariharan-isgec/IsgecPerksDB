USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsApproversUpdate]
  @Original_FinYear NVarChar(4), 
  @Original_CardNo NVarChar(8), 
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @Apparaiser NVarChar(8),
  @ReviewerI NVarChar(8),
  @ReviewerII NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMS_Approvers] SET 
   [FinYear] = @FinYear
  ,[CardNo] = @CardNo
  ,[Apparaiser] = @Apparaiser
  ,[ReviewerI] = @ReviewerI
  ,[ReviewerII] = @ReviewerII
  WHERE
  [FinYear] = @Original_FinYear
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
