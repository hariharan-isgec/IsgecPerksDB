USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMannualCorrectionHistoryInsert]
  @AttenID Int,
  @AttenDate DateTime,
  @CardNo NVarChar(8),
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @PunchStatusID NVarChar(2),
  @MannuallyCorrectedOn DateTime,
  @MannuallyCorrectedBy NVarChar(8),
  @NewPunch1Time Decimal(6,2),
  @NewPunch2Time Decimal(6,2),
  @NewPunchStatusID NVarChar(2),
  @Remarks NVarChar(100),
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [ATN_MannualCorrectionHistory]
  (
   [AttenID]
  ,[AttenDate]
  ,[CardNo]
  ,[Punch1Time]
  ,[Punch2Time]
  ,[PunchStatusID]
  ,[MannuallyCorrectedOn]
  ,[MannuallyCorrectedBy]
  ,[NewPunch1Time]
  ,[NewPunch2Time]
  ,[NewPunchStatusID]
  ,[Remarks]
  )
  VALUES
  (
   @AttenID
  ,@AttenDate
  ,@CardNo
  ,@Punch1Time
  ,@Punch2Time
  ,@PunchStatusID
  ,@MannuallyCorrectedOn
  ,@MannuallyCorrectedBy
  ,@NewPunch1Time
  ,@NewPunch2Time
  ,@NewPunchStatusID
  ,@Remarks
  )
  SET @Return_SerialNo = Scope_Identity()
GO
