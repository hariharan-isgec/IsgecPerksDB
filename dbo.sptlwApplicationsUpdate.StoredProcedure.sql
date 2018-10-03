USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwApplicationsUpdate]
  @Original_ApplicationID Int, 
  @Description NVarChar(100),
  @WebPath NVarChar(250),
  @GenerateDefaults Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_Applications] SET 
   [Description] = @Description
  ,[WebPath] = @WebPath
  ,[GenerateDefaults] = @GenerateDefaults
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
