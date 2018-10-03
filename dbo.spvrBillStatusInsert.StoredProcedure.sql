USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusInsert]
  @BillStatusID Int,
  @Description NVarChar(50),
  @Return_BillStatusID Int = null OUTPUT 
  AS
  INSERT [VR_BillStatus]
  (
   [BillStatusID]
  ,[Description]
  )
  VALUES
  (
   @BillStatusID
  ,@Description
  )
  SET @Return_BillStatusID = @BillStatusID
GO
