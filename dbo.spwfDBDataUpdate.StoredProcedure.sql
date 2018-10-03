USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBDataUpdate]
  @Original_DBDataID Int, 
  @Description NVarChar(50),
  @IsProcedure Bit,
  @FromERP Bit,
  @IsList Bit,
  @IsErpAFSCall Bit,
  @AFSDllName NVarChar(150),
  @AFSFunctionName NVarChar(150),
  @AFSParameters NVarChar(250),
  @DataSQL NVarChar(4000),
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_DBData] SET 
   [Description] = @Description
  ,[IsProcedure] = @IsProcedure
  ,[FromERP] = @FromERP
  ,[IsList] = @IsList
  ,[IsErpAFSCall] = @IsErpAFSCall
  ,[AFSDllName] = @AFSDllName
  ,[AFSFunctionName] = @AFSFunctionName
  ,[AFSParameters] = @AFSParameters
  ,[DataSQL] = @DataSQL
  WHERE
  [DBDataID] = @Original_DBDataID
  SET @RowCount = @@RowCount
GO
