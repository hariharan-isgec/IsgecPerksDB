USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsInsert]
  @DivisionID NVarChar(6),
  @Description NVarChar(50),
  @Return_DivisionID NVarChar(6) = null OUTPUT
  AS
  INSERT [HRM_Divisions]
  (
   [DivisionID]
  ,[Description]
  )
  VALUES
  (
   @DivisionID
  ,@Description
  )
  SET @Return_DivisionID = @DivisionID
GO
