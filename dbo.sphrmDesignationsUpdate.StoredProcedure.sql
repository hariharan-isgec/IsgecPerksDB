USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDesignationsUpdate]
  @Description NVarChar(30),
  @ShortName NVarChar(30),
  @Sequence Int,
  @Original_DesignationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Designations] SET 
   [Description] = @Description
  ,[ShortName] = @ShortName
  ,[Sequence] = @Sequence
  WHERE
  [DesignationID] = @Original_DesignationID
  SET @RowCount = @@RowCount
GO
