USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmPRJByEmpInsert]
  @ProjectID NVarChar(6),
  @CardNo NVarChar(8),
  @Return_ProjectID NVarChar(6) = null OUTPUT
  AS
  INSERT [IDM_ProjectsByEmployee]
  (
   [ProjectID]
  ,[CardNo]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,UPPER(@CardNo)
  )
  SET @Return_ProjectID = @ProjectID
GO
