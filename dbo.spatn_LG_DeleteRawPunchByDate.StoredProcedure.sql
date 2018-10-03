USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spatn_LG_DeleteRawPunchByDate]
  @PunchDate DateTime
  AS
  DELETE [ATN_RawPunch]
  WHERE 
     [ATN_RawPunch].[PunchDate] = @PunchDate
GO
