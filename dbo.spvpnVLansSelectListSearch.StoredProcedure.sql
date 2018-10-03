USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VLanIP NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (VLanIP)
  SELECT [VPN_VLans].[VLanIP] FROM [VPN_VLans]
 WHERE  
   ( 
         LOWER(ISNULL([VPN_VLans].[VLanIP],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VPN_VLans].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VLanIP' THEN [VPN_VLans].[VLanIP] END,
     CASE @orderBy WHEN 'VLanIP DESC' THEN [VPN_VLans].[VLanIP] END DESC,
     CASE @orderBy WHEN 'Description' THEN [VPN_VLans].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [VPN_VLans].[Description] END DESC,
     CASE @orderBy WHEN 'Active' THEN [VPN_VLans].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [VPN_VLans].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[VPN_VLans].[VLanIP] ,
		[VPN_VLans].[Description] ,
		[VPN_VLans].[Active]  
  FROM [VPN_VLans] 
    	INNER JOIN #PageIndex
          ON [VPN_VLans].[VLanIP] = #PageIndex.VLanIP
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
