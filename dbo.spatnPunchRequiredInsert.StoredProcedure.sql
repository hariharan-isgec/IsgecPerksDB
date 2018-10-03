USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchRequiredInsert]
  @CardNo NVarChar(8),
  @NoPunch Bit,
  @OnePunch Bit,
  @RuleException Bit,
	@AllLocation	bit,
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [ATN_PunchRequired]
  (
   [CardNo]
  ,[NoPunch]
  ,[OnePunch]
  ,[RuleException]
	,[AllLocation]
  )
  VALUES
  (
   @CardNo
  ,@NoPunch
  ,@OnePunch
  ,@RuleException
	,@AllLocation 
  )
  SET @Return_RecordID = Scope_Identity()
GO
