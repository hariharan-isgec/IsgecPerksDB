USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttatchmentsInsert]
  @CallID Int,
  @AttatchmentName NVarChar(250),
  @DiskFileName NVarChar(50),
  @IsImage Bit,
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [CAL_Attatchments]
  (
   [CallID]
  ,[AttatchmentName]
  ,[DiskFileName]
  ,[IsImage]
  )
  VALUES
  (
   @CallID
  ,@AttatchmentName
  ,@DiskFileName
  ,@IsImage
  )
  SET @Return_SerialNo = Scope_Identity()
GO
