USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersInsert]
  @Quarter Int,
  @Description NVarChar(50),
  @Return_Quarter Int = null OUTPUT 
  AS
  INSERT [COST_Quarters]
  (
   [Quarter]
  ,[Description]
  )
  VALUES
  (
   @Quarter
  ,@Description
  )
  SET @Return_Quarter = @Quarter
GO
