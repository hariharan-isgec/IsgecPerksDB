USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorInsert]
  @OriginatorID NVarChar(3),
  @Description NVarChar(30),
  @Return_OriginatorID NVarChar(3) = null OUTPUT
  AS
  INSERT [IDM_Originator]
  (
   [OriginatorID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@OriginatorID)
  ,@Description
  )
  SET @Return_OriginatorID = @OriginatorID
GO
