USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spatn_LG_DeleteRawPunchByCardNoDate]
  @CardNo NVarChar(8),
  @PunchDate DateTime
  AS
  DELETE [ATN_RawPunch]
  WHERE 
      [ATN_RawPunch].[CardNo] = @CardNo
  AND [ATN_RawPunch].[PunchDate] = @PunchDate
GO
