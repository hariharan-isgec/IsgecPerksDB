USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberInsert]
  @Description NVarChar(50),
  @LastNumber Int,
  @Year Int,
  @Active Bit,
  @Return_NumberID Int = null OUTPUT 
  AS
  INSERT [SPMT_DCLastNumber]
  (
   [Description]
  ,[LastNumber]
  ,[Year]
  ,[Active]
  )
  VALUES
  (
   @Description
  ,@LastNumber
  ,@Year
  ,@Active
  )
  SET @Return_NumberID = Scope_Identity()
GO
