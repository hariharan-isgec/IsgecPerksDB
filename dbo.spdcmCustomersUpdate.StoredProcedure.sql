USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersUpdate]
  @Original_CustomerID NVarChar(6), 
  @Original_ProjectID NVarChar(6), 
  @Description NVarChar(50),
  @Address1 NVarChar(50),
  @Address2 NVarChar(50),
  @Address3 NVarChar(50),
  @Address4 NVarChar(50),
  @ToEMailID NVarChar(250),
  @CCEmailID NVarChar(1000),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_Customers] SET 
   [Description] = @Description
  ,[Address1] = @Address1
  ,[Address2] = @Address2
  ,[Address3] = @Address3
  ,[Address4] = @Address4
  ,[ToEMailID] = @ToEMailID
  ,[CCEmailID] = @CCEmailID
  WHERE
  [CustomerID] = @Original_CustomerID
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
