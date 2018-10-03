USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsInsert]
  @ElementID NVarChar(8),
  @Description NVarChar(100),
  @ResponsibleAgencyID Int,
  @ParentElementID NVarChar(8),
  @ElementLevel Int,
  @Prefix NVarChar(1000),
  @Return_ElementID NVarChar(8) = null OUTPUT 
  AS
  INSERT [PAK_Elements]
  (
   [ElementID]
  ,[Description]
  ,[ResponsibleAgencyID]
  ,[ParentElementID]
  ,[ElementLevel]
  ,[Prefix]
  )
  VALUES
  (
   UPPER(@ElementID)
  ,@Description
  ,@ResponsibleAgencyID
  ,@ParentElementID
  ,@ElementLevel
  ,@Prefix
  )
  SET @Return_ElementID = @ElementID
GO
