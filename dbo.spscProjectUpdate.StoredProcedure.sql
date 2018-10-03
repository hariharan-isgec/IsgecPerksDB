USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscProjectUpdate]
  @Original_RequestID Int, 
  @Original_SerialNo Int, 
  @RequestID Int,
  @ProjectID NVarChar(6),
  @ElementID NVarChar(8),
  @Amount Decimal(18,2),
  @IsFromProject Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SC_Project] SET 
   [RequestID] = @RequestID
  ,[ProjectID] = @ProjectID
  ,[ElementID] = @ElementID
  ,[Amount] = @Amount
  ,[IsFromProject] = @IsFromProject
  WHERE
  [RequestID] = @Original_RequestID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
