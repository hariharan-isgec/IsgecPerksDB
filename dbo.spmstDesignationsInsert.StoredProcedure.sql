USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDesignationsInsert]
  @DesignationID Int,
  @Description NVarChar(30),
  @ShortName NVarChar(30),
  @Sequence Int,
  @Return_DesignationID Int = null OUTPUT
  AS
  INSERT [HRM_Designations]
  (
   [DesignationID]
  ,[Description]
  ,[ShortName]
  ,[Sequence]
  )
  VALUES
  (
   @DesignationID
  ,@Description
  ,@ShortName
  ,@Sequence
  )
  SET @Return_DesignationID = @DesignationID
GO
