USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIInsert]
  @MonthID Int,
  @ProjectID NVarChar(6),
  @SiteName NVarChar(50),
  @Remarks NVarChar(250),
  @SAStatusID Int,
  @VerifiedBy NVarChar(8),
  @FinYear NVarChar(4),
  @VerifiedOn DateTime,
  @FileName NVarChar(100),
  @DiskFileName NvarChar(250),
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [ATN_SABySI]
  (
   [MonthID]
  ,[ProjectID]
  ,[SiteName]
  ,[Remarks]
  ,[SAStatusID]
  ,[VerifiedBy]
  ,[FinYear]
  ,[VerifiedOn]
  ,[FileName]
  ,[DiskFileName]
  )
  VALUES
  (
   @MonthID
  ,@ProjectID
  ,@SiteName
  ,@Remarks
  ,@SAStatusID
  ,@VerifiedBy
  ,@FinYear
  ,@VerifiedOn
  ,@FileName
  ,@DiskFileName
  )
  SET @Return_SerialNo = Scope_Identity()
GO
