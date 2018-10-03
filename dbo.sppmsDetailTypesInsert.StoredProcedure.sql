USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesInsert]
  @DetailTypeID NVarChar(6),
  @Description NVarChar(30),
  @Return_DetailTypeID NVarChar(6) = null OUTPUT 
  AS
  INSERT [PMS_DetailTypes]
  (
   [DetailTypeID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@DetailTypeID)
  ,@Description
  )
  SET @Return_DetailTypeID = @DetailTypeID
GO
