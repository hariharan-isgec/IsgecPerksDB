USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINInsert]
  @BPID NVarChar(9),
  @GSTIN Int,
  @Description NVarChar(50),
  @Return_BPID NVarChar(9) = null OUTPUT, 
  @Return_GSTIN Int = null OUTPUT 
  AS
  INSERT [VR_BPGSTIN]
  (
   [BPID]
  ,[GSTIN]
  ,[Description]
  )
  VALUES
  (
   UPPER(@BPID)
  ,@GSTIN
  ,@Description
  )
  SET @Return_BPID = @BPID
  SET @Return_GSTIN = @GSTIN
GO
