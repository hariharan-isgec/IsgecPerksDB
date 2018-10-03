USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomCompaniesUpdate]
  @Original_CompanyID NVarChar(6), 
  @CompanyID NVarChar(6),
  @Description NVarChar(60),
  @ShortName NVarChar(20),
  @BaaNID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Companies] SET 
   [CompanyID] = @CompanyID
  ,[Description] = @Description
  ,[ShortName] = @ShortName
  ,[BaaNID] = @BaaNID
  WHERE
  [CompanyID] = @Original_CompanyID
  SET @RowCount = @@RowCount
GO
