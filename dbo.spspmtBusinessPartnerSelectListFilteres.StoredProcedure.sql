USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBusinessPartnerSelectListFilteres]
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
 ,BPID NVarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BPID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_BusinessPartner].[BPID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_BusinessPartner] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BPID' THEN '[VR_BusinessPartner].[BPID]'
                        WHEN 'BPID DESC' THEN '[VR_BusinessPartner].[BPID] DESC'
                        WHEN 'BPName' THEN '[VR_BusinessPartner].[BPName]'
                        WHEN 'BPName DESC' THEN '[VR_BusinessPartner].[BPName] DESC'
                        WHEN 'Address1Line' THEN '[VR_BusinessPartner].[Address1Line]'
                        WHEN 'Address1Line DESC' THEN '[VR_BusinessPartner].[Address1Line] DESC'
                        WHEN 'Address2Line' THEN '[VR_BusinessPartner].[Address2Line]'
                        WHEN 'Address2Line DESC' THEN '[VR_BusinessPartner].[Address2Line] DESC'
                        WHEN 'City' THEN '[VR_BusinessPartner].[City]'
                        WHEN 'City DESC' THEN '[VR_BusinessPartner].[City] DESC'
                        WHEN 'EMailID' THEN '[VR_BusinessPartner].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[VR_BusinessPartner].[EMailID] DESC'
                        ELSE '[VR_BusinessPartner].[BPID]'
                    END
  EXEC (@LGSQL)

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
