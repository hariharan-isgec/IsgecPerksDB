USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomCompaniesInsert]
  @CompanyID NVarChar(6),
  @Description NVarChar(60),
  @ShortName NVarChar(20),
  @BaaNID NVarChar(3),
  @Return_CompanyID NVarChar(6) = null OUTPUT 
  AS
  INSERT [HRM_Companies]
  (
   [CompanyID]
  ,[Description]
  ,[ShortName]
  ,[BaaNID]
  )
  VALUES
  (
   UPPER(@CompanyID)
  ,@Description
  ,@ShortName
  ,@BaaNID
  )
  SET @Return_CompanyID = @CompanyID
GO
