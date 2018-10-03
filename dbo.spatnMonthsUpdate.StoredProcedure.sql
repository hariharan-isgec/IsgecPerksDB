USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMonthsUpdate]
  @Original_MonthID NVarChar(3), 
  @ShortName NVarChar(3),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_Months] SET 
   [ShortName] = @ShortName
  ,[Description] = @Description
  WHERE
  [MonthID] = @Original_MonthID
  SET @RowCount = @@RowCount
GO
