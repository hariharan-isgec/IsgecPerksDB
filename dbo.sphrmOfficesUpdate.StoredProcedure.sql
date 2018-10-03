USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficesUpdate]
  @Description NVarChar(50),
  @Address NVarChar(250),
  @City NVarChar(50),
  @Original_OfficeID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Offices] SET 
   [Description] = @Description
  ,[Address] = @Address
  ,[City] = @City
  WHERE
  [OfficeID] = @Original_OfficeID
  SET @RowCount = @@RowCount
GO
