USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spatn_LG_getapproverlist]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     a.CardNo, a.EmployeeName, b.CardNo AS vcardno, b.EmployeeName AS vname, c.CardNo AS acardno, c.EmployeeName AS aname
FROM         HRM_Employees AS a LEFT OUTER JOIN
                      HRM_Employees AS b ON a.VerifierID = b.CardNo LEFT OUTER JOIN
                      HRM_Employees AS c ON a.ApproverID = c.CardNo
ORDER BY a.CardNo
END
GO
