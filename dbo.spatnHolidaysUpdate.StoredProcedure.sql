USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnHolidaysUpdate]
  @Holiday DateTime,
  @OfficeID Int,
  @Description NVarChar(30),
  @PunchStatusID NVarChar(2),
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_Holidays] SET 
   [Holiday] = @Holiday
  ,[OfficeID] = @OfficeID
  ,[Description] = @Description
  ,[PunchStatusID] = @PunchStatusID
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
