USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesInsert]
  @TmtlTypeID NVarChar(2),
  @Description NVarChar(50),
  @Return_TmtlTypeID NVarChar(2) = null OUTPUT
  AS
  INSERT [IDM_TransmittalTypes]
  (
   [TmtlTypeID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@TmtlTypeID)
  ,@Description
  )
  SET @Return_TmtlTypeID = @TmtlTypeID
GO
