USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ITCALLv_CallLogStatus]
AS
SELECT     dbo.ADM_ITComplaints.CallID, dbo.ADM_ITComplaints.Description AS CallDetail, dbo.ADM_ITCallTypes.Description AS CallType, 
                      dbo.ADM_ITCallStatus.Description AS CallStatus, dbo.HRM_Employees.EmployeeName AS EndUser, dbo.ADM_ITComplaints.LoggedOn, 
                      aspnet_users_1.UserFullName AS LoggedBy, dbo.ADM_ITComplaintResponse.AttendedOn, dbo.aspnet_users.UserFullName AS AttendedBy, 
                      dbo.ADM_ITComplaintResponse.Remarks AS AttenderRemarks
FROM         dbo.ADM_ITComplaints INNER JOIN
                      dbo.ADM_ITCallTypes ON dbo.ADM_ITComplaints.CallTypeID = dbo.ADM_ITCallTypes.CallTypeID INNER JOIN
                      dbo.ADM_ITCallStatus ON dbo.ADM_ITComplaints.CallStatusID = dbo.ADM_ITCallStatus.CallStatusID INNER JOIN
                      dbo.ADM_ITComplaintResponse ON dbo.ADM_ITComplaints.CallID = dbo.ADM_ITComplaintResponse.CallID INNER JOIN
                      dbo.HRM_Employees ON dbo.ADM_ITComplaints.EndUserID = dbo.HRM_Employees.CardNo INNER JOIN
                      dbo.aspnet_users AS aspnet_users_1 ON dbo.ADM_ITComplaints.LoggedBy = aspnet_users_1.LoginID INNER JOIN
                      dbo.aspnet_users ON dbo.ADM_ITComplaintResponse.AttendedBy = dbo.aspnet_users.LoginID
WHERE     (dbo.ADM_ITComplaints.LoggedOn >= CONVERT(DATETIME, '2014-01-01 00:00:00', 102))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[17] 4[15] 2[16] 3) )"
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
         Begin Table = "ADM_ITComplaints"
            Begin Extent = 
               Top = 0
               Left = 214
               Bottom = 108
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ADM_ITCallTypes"
            Begin Extent = 
               Top = 24
               Left = 0
               Bottom = 102
               Right = 151
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ITCallStatus"
            Begin Extent = 
               Top = 6
               Left = 446
               Bottom = 84
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ITComplaintResponse"
            Begin Extent = 
               Top = 136
               Left = 454
               Bottom = 244
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 131
               Left = 240
               Bottom = 239
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_users_1"
            Begin Extent = 
               Top = 114
               Left = 7
               Bottom = 222
               Right = 177
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "aspnet_users"
            Begin Extent = 
               Top = 9
               Left = 651
               Bottom = 117
               Right ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ITCALLv_CallLogStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 821
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2400
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2325
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ITCALLv_CallLogStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ITCALLv_CallLogStatus'
GO
