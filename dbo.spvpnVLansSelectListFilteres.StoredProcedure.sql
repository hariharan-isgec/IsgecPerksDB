USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnVLansSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VLanIP NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VLanIP'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VPN_VLans].[VLanIP]'
  SET @LGSQL = @LGSQL + ' FROM [VPN_VLans] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VLanIP' THEN '[VPN_VLans].[VLanIP]'
                        WHEN 'VLanIP DESC' THEN '[VPN_VLans].[VLanIP] DESC'
                        WHEN 'Description' THEN '[VPN_VLans].[Description]'
                        WHEN 'Description DESC' THEN '[VPN_VLans].[Description] DESC'
                        WHEN 'Active' THEN '[VPN_VLans].[Active]'
                        WHEN 'Active DESC' THEN '[VPN_VLans].[Active] DESC'
                        ELSE '[VPN_VLans].[VLanIP]'
                    END
  EXEC (@LGSQL)

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
