USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIUpdate]
  @Original_SerialNo Int, 
  @MonthID Int,
  @ProjectID NVarChar(6),
  @SiteName NVarChar(50),
  @Remarks NVarChar(250),
  @SAStatusID Int,
  @VerifiedBy NVarChar(8),
  @FinYear NVarChar(4),
  @VerifiedOn DateTime,
  @FileName NVarChar(100),
  @DiskFileName NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_SABySI] SET 
   [MonthID] = @MonthID
  ,[ProjectID] = @ProjectID
  ,[SiteName] = @SiteName
  ,[Remarks] = @Remarks
  ,[SAStatusID] = @SAStatusID
  ,[VerifiedBy] = @VerifiedBy
  ,[FinYear] = @FinYear
  ,[VerifiedOn] = @VerifiedOn 
  ,[FileName] = @FileName
  ,[DiskFileName] = @DiskFileName 
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
