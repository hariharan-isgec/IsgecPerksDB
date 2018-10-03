USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsHInsert]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @FormStatusID NVarChar(30),
  @SubmittedOn DateTime,
  @ApprovedOn DateTime,
  @ApprovedBy NVarChar(8),
  @SubmittedToHROn DateTime,
  @Return_FinYear NVarChar(4) = null OUTPUT, 
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [PMS_FormsH]
  (
   [FinYear]
  ,[CardNo]
  ,[FormStatusID]
  ,[SubmittedOn]
  ,[ApprovedOn]
  ,[ApprovedBy]
  ,[SubmittedToHROn]
  )
  VALUES
  (
   UPPER(@FinYear)
  ,UPPER(@CardNo)
  ,@FormStatusID
  ,@SubmittedOn
  ,@ApprovedOn
  ,@ApprovedBy
  ,@SubmittedToHROn
  )
  SET @Return_FinYear = @FinYear
  SET @Return_CardNo = @CardNo
GO
