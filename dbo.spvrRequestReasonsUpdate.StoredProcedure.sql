USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestReasonsUpdate]
  @Original_ReasonID Int, 
  @Description NVarChar(100),
  @Transporter Bit,
  @ISGEC Bit,
  @Supplier Bit,
  @Other Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_RequestReasons] SET 
   [Description] = @Description
  ,[Transporter] = @Transporter
  ,[ISGEC] = @ISGEC
  ,[Supplier] = @Supplier
  ,[Other] = @Other
  WHERE
  [ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
