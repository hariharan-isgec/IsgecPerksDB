USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransportersSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TransporterID NVarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TransporterID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_Transporters].[TransporterID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_Transporters] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TransporterID' THEN '[VR_Transporters].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[VR_Transporters].[TransporterID] DESC'
                        WHEN 'TransporterName' THEN '[VR_Transporters].[TransporterName]'
                        WHEN 'TransporterName DESC' THEN '[VR_Transporters].[TransporterName] DESC'
                        WHEN 'Address1Line' THEN '[VR_Transporters].[Address1Line]'
                        WHEN 'Address1Line DESC' THEN '[VR_Transporters].[Address1Line] DESC'
                        WHEN 'Address2Line' THEN '[VR_Transporters].[Address2Line]'
                        WHEN 'Address2Line DESC' THEN '[VR_Transporters].[Address2Line] DESC'
                        WHEN 'City' THEN '[VR_Transporters].[City]'
                        WHEN 'City DESC' THEN '[VR_Transporters].[City] DESC'
                        WHEN 'EMailID' THEN '[VR_Transporters].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[VR_Transporters].[EMailID] DESC'
                        ELSE '[VR_Transporters].[TransporterID]'
                    END
  EXEC (@LGSQL)

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
