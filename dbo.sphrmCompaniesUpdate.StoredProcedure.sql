USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmCompaniesUpdate]
  @Description NVarChar(60),
  @ShortName NVarChar(20),
  @BaaNID NVarChar(3),
  @Original_CompanyID NVarChar(6), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Companies] SET 
   [Description] = @Description
  ,[ShortName] = @ShortName
  ,[BaaNID] = @BaaNID
  WHERE
  [CompanyID] = @Original_CompanyID
  SET @RowCount = @@RowCount
GO
