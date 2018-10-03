USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtIsgecGSTINInsert]
  @GSTID Int,
  @Description NVarChar(50),
  @State NVarChar(50),
  @Return_GSTID Int = null OUTPUT 
  AS
  INSERT [SPMT_IsgecGSTIN]
  (
   [GSTID]
  ,[Description]
  ,[State]
  )
  VALUES
  (
   @GSTID
  ,@Description
  ,@State
  )
  SET @Return_GSTID = @GSTID
GO
