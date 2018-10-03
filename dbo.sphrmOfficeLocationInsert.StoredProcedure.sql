USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationInsert]
  @LocationID Int,
  @OfficeID Int,
  @Description NVarChar(50),
  @Return_LocationID Int = null OUTPUT, 
  @Return_OfficeID Int = null OUTPUT 
  AS
  INSERT [HRM_OfficeLocation]
  (
   [LocationID]
  ,[OfficeID]
  ,[Description]
  )
  VALUES
  (
   @LocationID
  ,@OfficeID
  ,@Description
  )
  SET @Return_LocationID = @LocationID
  SET @Return_OfficeID = @OfficeID
GO
