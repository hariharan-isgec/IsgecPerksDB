USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsDInsert]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @KRA NVarChar(500),
  @KPI NVarChar(1000),
  @Competancy NVarChar(500),
  @DetailTypeID NVarChar(6),
  @Return_FinYear NVarChar(4) = null OUTPUT, 
  @Return_CardNo NVarChar(8) = null OUTPUT, 
  @Return_SrNo Int = null OUTPUT 
  AS
  INSERT [PMS_FormsD]
  (
   [FinYear]
  ,[CardNo]
  ,[KRA]
  ,[KPI]
  ,[Competancy]
  ,[DetailTypeID]
  )
  VALUES
  (
   UPPER(@FinYear)
  ,UPPER(@CardNo)
  ,@KRA
  ,@KPI
  ,@Competancy
  ,@DetailTypeID
  )
  SET @Return_FinYear = @FinYear
  SET @Return_CardNo = @CardNo
  SET @Return_SrNo = Scope_Identity()
GO
