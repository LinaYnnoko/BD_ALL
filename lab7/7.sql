--LAB 7

use UNIVER;

-- ������� 1
use UNIVER;
GO
CREATE VIEW [�������������]
 AS SELECT TEACHER [���],
           TEACHER_NAME [��� �������������],
           GENDER [���],
		   PULPIT [��� �������] from TEACHER;

-- ������� 2

GO
CREATE VIEW [���������� ������]
	AS SELECT
		FACULTY.FACULTY_NAME,
		COUNT(PULPIT.FACULTY) [COUNT]
	FROM FACULTY
	JOIN PULPIT ON FACULTY.FACULTY = PULPIT.FACULTY
	GROUP BY PULPIT.FACULTY, FACULTY.FACULTY_NAME;

-- ������� 3
GO
CREATE VIEW [���������]
	AS SELECT
		AUDITORIUM.AUDITORIUM,
		AUDITORIUM.AUDITORIUM_TYPE
	FROM AUDITORIUM;

GO
INSERT ��������� VALUES('316-4', '��-�');

-- ������� 4

GO
CREATE VIEW [����������_���������]
	AS SELECT
		AUDITORIUM.AUDITORIUM,
		AUDITORIUM.AUDITORIUM_TYPE
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE LIKE '��%' WITH CHECK OPTION;

GO
INSERT ����������_��������� VALUES('315-4', '��-�');
GO
UPDATE [����������_���������]
SET AUDITORIUM = '415-4'
WHERE AUDITORIUM = '315-4';

-- ������� 5

GO
CREATE VIEW [����������]
	AS SELECT TOP(10) *
	FROM SUBJECT_T
	ORDER BY SUBJECT_T.SUBJECT_NAME;

-- ������� 6

GO
ALTER VIEW [PULPIT COUNT] WITH SCHEMABINDING
	AS SELECT
		FACULTY_NAME,
		COUNT(PULPIT) [COUNT]
	FROM dbo.FACULTY
	JOIN dbo.PULPIT ON FACULTY.FACULTY = PULPIT.FACULTY
	GROUP BY FACULTY_NAME;