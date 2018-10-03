USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakWBSInsert]
  @WBSID NVarChar(8),
  @Description NVarChar(50),
  @WBSLevel Int,
  @ResponsibleAgencyID Int,
  @Return_WBSID NVarChar(8) = null OUTPUT 
  AS
  INSERT [IDM_WBS]
  (
   [WBSID]
  ,[Description]
  ,[WBSLevel]
  ,[ResponsibleAgencyID]
  )
  VALUES
  (
   UPPER(@WBSID)
  ,@Description
  ,@WBSLevel
  ,@ResponsibleAgencyID
  )
  SET @Return_WBSID = @WBSID
GO
