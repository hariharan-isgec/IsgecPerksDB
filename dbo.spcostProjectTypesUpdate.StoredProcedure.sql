USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesUpdate]
  @Original_ProjectTypeID NVarChar(10), 
  @ProjectTypeID NVarChar(10),
  @ProjectTypeDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_ProjectTypes] SET 
   [ProjectTypeID] = @ProjectTypeID
  ,[ProjectTypeDescription] = @ProjectTypeDescription
  WHERE
  [ProjectTypeID] = @Original_ProjectTypeID
  SET @RowCount = @@RowCount
GO
