USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TransporterID NVarChar(9) NOT NULL
  )
  INSERT INTO #PageIndex (TransporterID)
  SELECT [VR_Transporters].[TransporterID] FROM [VR_Transporters]
 WHERE  
   ( 
         LOWER(ISNULL([VR_Transporters].[TransporterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Transporters].[TransporterName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Transporters].[Address1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Transporters].[Address2Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Transporters].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_Transporters].[EMailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TransporterID' THEN [VR_Transporters].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [VR_Transporters].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterName' THEN [VR_Transporters].[TransporterName] END,
     CASE @OrderBy WHEN 'TransporterName DESC' THEN [VR_Transporters].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'Address1Line' THEN [VR_Transporters].[Address1Line] END,
     CASE @OrderBy WHEN 'Address1Line DESC' THEN [VR_Transporters].[Address1Line] END DESC,
     CASE @OrderBy WHEN 'Address2Line' THEN [VR_Transporters].[Address2Line] END,
     CASE @OrderBy WHEN 'Address2Line DESC' THEN [VR_Transporters].[Address2Line] END DESC,
     CASE @OrderBy WHEN 'City' THEN [VR_Transporters].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [VR_Transporters].[City] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [VR_Transporters].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [VR_Transporters].[EMailID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VR_Transporters].[TransporterID] ,
		[VR_Transporters].[TransporterName] ,
		[VR_Transporters].[Address1Line] ,
		[VR_Transporters].[Address2Line] ,
		[VR_Transporters].[City] ,
		[VR_Transporters].[EMailID]  
  FROM [VR_Transporters] 
    	INNER JOIN #PageIndex
          ON [VR_Transporters].[TransporterID] = #PageIndex.TransporterID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
