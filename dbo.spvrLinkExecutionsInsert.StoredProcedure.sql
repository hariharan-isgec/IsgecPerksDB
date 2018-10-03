USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLinkExecutionsInsert]
  @LinkID Int,
  @SRNNo Int,
  @LinkedBy NVarChar(8),
  @LinkedOn DateTime,
  @Return_LinkID Int = null OUTPUT, 
  @Return_SRNNo Int = null OUTPUT 
  AS
  INSERT [VR_LinkExecutions]
  (
   [LinkID]
  ,[SRNNo]
  ,[LinkedBy]
  ,[LinkedOn]
  )
  VALUES
  (
   @LinkID
  ,@SRNNo
  ,@LinkedBy
  ,@LinkedOn
  )
  SET @Return_LinkID = @LinkID
  SET @Return_SRNNo = @SRNNo
GO
