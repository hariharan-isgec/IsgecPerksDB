USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsInsert]
  @UnitID NVarChar(3),
  @Description NVarChar(30),
  @Return_UnitID NVarChar(3) = null OUTPUT 
  AS
  INSERT [EITL_Units]
  (
   [UnitID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@UnitID)
  ,@Description
  )
  SET @Return_UnitID = @UnitID
GO
