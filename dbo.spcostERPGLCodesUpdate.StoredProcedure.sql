USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesUpdate]
  @Original_GLCode NVarChar(7), 
  @GLCode NVarChar(7),
  @GLDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_ERPGLCodes] SET 
   [GLCode] = @GLCode
  ,[GLDescription] = @GLDescription
  WHERE
  [GLCode] = @Original_GLCode
  SET @RowCount = @@RowCount
GO
