SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[newView]
--WITH ENCRYPTION, SCHEMABINDING, VIEW_METADATA
AS
    SELECT FactCallCenterID,
           DateKey,
           WageType,
           Shift,
           LevelOneOperators,
           LevelTwoOperators,
           TotalOperators,
           Calls,
           AutomaticResponses,
           Orders,
           IssuesRaised,
           AverageTimePerIssue,
           ServiceGrade,
           Date FROM dbo.FactCallCenter
-- WITH CHECK OPTION
GO
