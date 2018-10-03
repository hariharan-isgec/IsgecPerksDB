USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsInsert]
  @RegionName NVarChar(50),
  @Return_RegionID Int = null OUTPUT 
  AS
  INSERT [QCM_Regions]
  (
   [RegionName]
  )
  VALUES
  (
   @RegionName
  )
  SET @Return_RegionID = Scope_Identity()
GO
