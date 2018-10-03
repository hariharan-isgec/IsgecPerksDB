USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakBusinessPartnerSelectListSearch]
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
 ,BPID NVarChar(9) NOT NULL
  )
  INSERT INTO #PageIndex (BPID)
  SELECT [VR_BusinessPartner].[BPID] FROM [VR_BusinessPartner]
 WHERE  
   ( 
         LOWER(ISNULL([VR_BusinessPartner].[BPID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BusinessPartner].[BPName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BusinessPartner].[Address1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BusinessPartner].[Address2Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BusinessPartner].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_BusinessPartner].[EMailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'BPID' THEN [VR_BusinessPartner].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [VR_BusinessPartner].[BPID] END DESC,
     CASE @OrderBy WHEN 'BPName' THEN [VR_BusinessPartner].[BPName] END,
     CASE @OrderBy WHEN 'BPName DESC' THEN [VR_BusinessPartner].[BPName] END DESC,
     CASE @OrderBy WHEN 'Address1Line' THEN [VR_BusinessPartner].[Address1Line] END,
     CASE @OrderBy WHEN 'Address1Line DESC' THEN [VR_BusinessPartner].[Address1Line] END DESC,
     CASE @OrderBy WHEN 'Address2Line' THEN [VR_BusinessPartner].[Address2Line] END,
     CASE @OrderBy WHEN 'Address2Line DESC' THEN [VR_BusinessPartner].[Address2Line] END DESC,
     CASE @OrderBy WHEN 'City' THEN [VR_BusinessPartner].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [VR_BusinessPartner].[City] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [VR_BusinessPartner].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [VR_BusinessPartner].[EMailID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [VR_BusinessPartner].*  
  FROM [VR_BusinessPartner] 
      INNER JOIN #PageIndex
          ON [VR_BusinessPartner].[BPID] = #PageIndex.BPID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
