USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[TOS_DesCLPs]
AS
SELECT     TOP (100) PERCENT dbo.TOS_Projects.ProjectID, dbo.TOS_Projects.Description AS ProjectName, dbo.TOS_CLPDataDetails.CLPID, 
                      dbo.TOS_CLPDataDetails.Description AS CLPName, dbo.TOS_CLPDataDetails.Quantity, dbo.TOS_CLPDataDetails.DisplayType, 
                      dbo.TOS_CLPDataDetails.Sequence, DATEDIFF(d, dbo.TOS_CLPDataDetails.desEndtDefined, dbo.TOS_CLPDataDetails.desEndtActual) AS DelayDays, 
                      dbo.TOS_Tasks.wuDefined, dbo.TOS_Tasks.wuEntered, dbo.TOS_Tasks.wuBalance, dbo.TOS_Tasks.stdtDefined, dbo.TOS_Tasks.endtDefined, 
                      dbo.TOS_Tasks.stdtActual, dbo.TOS_Tasks.endtActual, dbo.TOS_Tasks.ElementID, dbo.TOS_Tasks.AssignedTo, 
                      dbo.TOS_FunctionalArea.Description AS FunctionalArea, dbo.TOS_CLPDataDetails.desEndtDefined, dbo.TOS_CLPDataDetails.desEndtActual, 
                      dbo.TOS_CLPDataDetails.desdelayStatus
FROM         dbo.TOS_CLPDataDetails INNER JOIN
                      dbo.TOS_BaseClpData ON dbo.TOS_CLPDataDetails.ProjectID = dbo.TOS_BaseClpData.ProjectID AND 
                      dbo.TOS_CLPDataDetails.ProgressID = dbo.TOS_BaseClpData.ProgressID INNER JOIN
                      dbo.TOS_CLPs ON dbo.TOS_CLPDataDetails.ProjectID = dbo.TOS_CLPs.ProjectID AND 
                      dbo.TOS_CLPDataDetails.CLPID = dbo.TOS_CLPs.CLPID INNER JOIN
                      dbo.TOS_Tasks ON dbo.TOS_CLPs.ProjectID = dbo.TOS_Tasks.ProjectID AND dbo.TOS_CLPs.desTaskID = dbo.TOS_Tasks.TaskID INNER JOIN
                      dbo.TOS_Projects ON dbo.TOS_BaseClpData.ProjectID = dbo.TOS_Projects.ProjectID LEFT OUTER JOIN
                      dbo.TOS_FunctionalArea ON dbo.TOS_Tasks.FunctionalAreaID = dbo.TOS_FunctionalArea.FunctionalAreaID
ORDER BY dbo.TOS_Projects.ProjectID, dbo.TOS_CLPDataDetails.Sequence
GO
