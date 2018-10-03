USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsInsert]
  @Description NVarChar(100),
  @Transporter Bit,
  @ISGEC Bit,
  @Supplier Bit,
  @Other Bit,
  @Return_ReasonID Int = null OUTPUT 
  AS
  INSERT [VR_RequestReasons]
  (
   [Description]
  ,[Transporter]
  ,[ISGEC]
  ,[Supplier]
  ,[Other]
  )
  VALUES
  (
   @Description
  ,@Transporter
  ,@ISGEC
  ,@Supplier
  ,@Other
  )
  SET @Return_ReasonID = Scope_Identity()
GO
