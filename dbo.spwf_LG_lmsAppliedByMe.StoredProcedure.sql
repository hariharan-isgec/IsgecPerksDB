USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spwf_LG_lmsAppliedByMe]
  @LoginID NVarChar(8) 
  AS
  BEGIN
  Declare @FinYear int
  select @FinYear=finyear from atn_finyear where active=1

  select count(leaveapplid) as [Applied] from atn_applheader where cardno=@loginid and finyear=@finyear

  END
GO
