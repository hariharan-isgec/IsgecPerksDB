USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Hkk_ITcalllogs]
AS
SELECT        dbo.ADM_ITComplaints.CallID, dbo.ADM_ITComplaints.EndUserID, dbo.ADM_ITComplaints.CallTypeID, dbo.ADM_ITComplaints.Description, dbo.ADM_ITComplaints.AssignedTo, dbo.ADM_ITComplaints.CallStatusID, 
                         dbo.ADM_ITComplaints.LoggedOn, dbo.ADM_ITComplaints.LoggedBy, dbo.ADM_ITComplaints.FirstAttendedOn, dbo.ADM_ITComplaints.ClosedOn, dbo.ADM_ITComplaints.FirstAttended, dbo.ADM_ITComplaints.Closed, 
                         dbo.ADM_ITComplaints.CallReceivedOn, dbo.ADM_ITComplaints.CallConverted, dbo.ADM_ITComplaints.ConvertedReference, dbo.ADM_ITComplaints.ConvertedRemarks, dbo.ADM_ITComplaints.Feedback, 
                         dbo.ADM_ITComplaintResponse.SerialNo, dbo.ADM_ITComplaintResponse.Remarks, dbo.ADM_ITComplaintResponse.AttendedOn, dbo.ADM_ITComplaintResponse.AttendedBy, dbo.ADM_ITComplaintResponse.AutoPosted, 
                         dbo.ADM_ITComplaintResponse.CallID AS Expr1
FROM            dbo.ADM_ITComplaintResponse INNER JOIN
                         dbo.ADM_ITComplaints ON dbo.ADM_ITComplaintResponse.CallID = dbo.ADM_ITComplaints.CallID
WHERE        (dbo.ADM_ITComplaints.CallTypeID LIKE '%joomla%') AND (dbo.ADM_ITComplaints.AssignedTo = '0639') AND (dbo.ADM_ITComplaints.EndUserID IN ('2266', '3039', '1640', '1863', '2266', '1542', '2992', '1896', '9975', '1548', 
                         '1863', '3051', '521', '9873', '768', '9454', '2715', '2152', '1745', '9679', '9263', '9105', '2548', '2849', '2849', '10046', '1505', '9815', '2954', '2812', '521', '10053', '1731', '1271', '2812', '1211', '9975', '1042', '1042', '5184', '521', 
                         '2102', '1511', '599', '1633', '1580', '1580', '9487', '2035', '2645', '9927', '1730', '9684', '2543', '9975', '1613', '2954', '9927', '9394', '2076', '9975', '2470', '2993', '1606', '5148', '2305', '2916', '1418', '9712'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[32] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ADM_ITComplaintResponse"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 191
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ITComplaints"
            Begin Extent = 
               Top = 9
               Left = 452
               Bottom = 200
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Hkk_ITcalllogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Hkk_ITcalllogs'
GO
