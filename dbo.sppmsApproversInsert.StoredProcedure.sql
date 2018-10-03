USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsApproversInsert]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @Apparaiser NVarChar(8),
  @ReviewerI NVarChar(8),
  @ReviewerII NVarChar(8),
  @Return_FinYear NVarChar(4) = null OUTPUT, 
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [PMS_Approvers]
  (
   [FinYear]
  ,[CardNo]
  ,[Apparaiser]
  ,[ReviewerI]
  ,[ReviewerII]
  )
  VALUES
  (
   UPPER(@FinYear)
  ,UPPER(@CardNo)
  ,@Apparaiser
  ,@ReviewerI
  ,@ReviewerII
  )
  SET @Return_FinYear = @FinYear
  SET @Return_CardNo = @CardNo
GO
