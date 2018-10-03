USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[MPTasks]  
	-- Add the parameters for the stored procedure here
	-- @TOSv_MPTasks NVarChar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
WITH TOSv_MPTasksCTE (ID, [Description], stdtDefined, endtDefined, ProjectID, ParentID,Lvl,Thread)
AS
(
    SELECT  ID, [Description], stdtDefined, endtDefined, ProjectID, ParentID, 
            1 As Lvl,
            ROW_NUMBER() over (order by ID) as Thread
    FROM TOSv_MPTasks
    where ParentID is null

    UNION ALL

    SELECT  P.ID, P.Description, P.stdtDefined, P.endtDefined, P.ProjectID, P.ParentID,    
            PP.Lvl+1,
            PP.Thread
    FROM TOSv_MPTasks AS P
    JOIN TOSv_MPTasksCTE AS PP ON P.ParentID = PP.ID
)
SELECT  replicate('--',Lvl) + right('>',Lvl) + [Description] as TaskName,
				ProjectID,
				ID,
        stdtDefined,
				endtDefined,
        ParentID,
        Lvl,
        Thread
FROM TOSv_MPTasksCTE
WHERE ProjectID = 'JB0848' 
order by Thread, Lvl, ID

END
GO
