USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_RawPunchByCardNoDate]
  @CardNo NVarChar(8),
  @PunchDate DateTime
  AS
  SELECT
		[ATN_RawPunch].*   
  FROM [ATN_RawPunch] 
  WHERE 
      [ATN_RawPunch].[CardNo] = @CardNo
  AND [ATN_RawPunch].[PunchDate] = @PunchDate
GO
