USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesInsert]
  @ProjectTypeID NVarChar(10),
  @ProjectTypeDescription NVarChar(50),
  @Return_ProjectTypeID NVarChar(10) = null OUTPUT 
  AS
  INSERT [COST_ProjectTypes]
  (
   [ProjectTypeID]
  ,[ProjectTypeDescription]
  )
  VALUES
  (
   UPPER(@ProjectTypeID)
  ,@ProjectTypeDescription
  )
  SET @Return_ProjectTypeID = @ProjectTypeID
GO
