USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearInsert]
  @FinYear Int,
  @Descpription NVarChar(50),
  @Return_FinYear Int = null OUTPUT 
  AS
  INSERT [COST_FinYear]
  (
   [FinYear]
  ,[Descpription]
  )
  VALUES
  (
   @FinYear
  ,@Descpription
  )
  SET @Return_FinYear = @FinYear
GO
