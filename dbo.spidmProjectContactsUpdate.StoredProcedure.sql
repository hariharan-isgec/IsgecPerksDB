USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmProjectContactsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_SerialNo Int, 
  @ProjectID NVarChar(6),
  @CardNo NVarChar(8),
  @ContactPerson NVarChar(50),
  @EmailID NVarChar(50),
  @ContactNo NVarChar(20),
  @Address1 NVarChar(60),
  @Address2 NVarChar(60),
  @Address3 NVarChar(60),
  @Address4 NVarChar(60),
  @Remarks NVarChar(250),
  @CCEmailID NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_ProjectContacts] SET 
   [ProjectID] = @ProjectID
  ,[CardNo] = @CardNo
  ,[ContactPerson] = @ContactPerson
  ,[EmailID] = @EmailID
  ,[ContactNo] = @ContactNo
  ,[Address1] = @Address1
  ,[Address2] = @Address2
  ,[Address3] = @Address3
  ,[Address4] = @Address4
  ,[Remarks] = @Remarks
  ,[CCEmailID] = @CCEmailID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
