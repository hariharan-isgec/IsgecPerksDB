USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLDetailsInsert]
  @BLID NVarChar(9),
  @SerialNo Int,
  @SizeAndTypeOfContainer NVarChar(50),
  @ContainerNumber NVarChar(50),
  @Remarks NVarChar(100),
  @Return_BLID NVarChar(9) = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [ELOG_BLDetails]
  (
   [BLID]
  ,[SerialNo]
  ,[SizeAndTypeOfContainer]
  ,[ContainerNumber]
  ,[Remarks]
  )
  VALUES
  (
   UPPER(@BLID)
  ,@SerialNo
  ,@SizeAndTypeOfContainer
  ,@ContainerNumber
  ,@Remarks
  )
  SET @Return_BLID = @BLID
  SET @Return_SerialNo = @SerialNo
GO
