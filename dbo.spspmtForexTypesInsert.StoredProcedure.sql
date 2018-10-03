USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesInsert]
  @FOREXTypeID NVarChar(20),
  @Description NVarChar(50),
  @Return_FOREXTypeID NVarChar(20) = null OUTPUT
  AS
  INSERT [SPMT_ForexTypes]
  (
   [FOREXTypeID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@FOREXTypeID)
  ,@Description
  )
  SET @Return_FOREXTypeID = @FOREXTypeID
GO
