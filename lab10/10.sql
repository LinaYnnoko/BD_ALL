use UNIVER;

-- #1
GO
DECLARE @subject char(30), @subjects char(500) ='';
DECLARE ISiT_subjects CURSOR FOR
	SELECT SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';

OPEN isit_subjects;
FETCH isit_subjects into @subject;
PRINT 'Дисциплины кафедры ИСиТ:';
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @subjects = RTRIM(@subject) +', ' +  @subjects;
		FETCH isit_subjects into @subject;
	END;
	PRINT @subjects;
CLOSE isit_subjects;

-- #2
--LOCAL

GO
DECLARE @subject char(30), @subjects char(500) ='';
DECLARE ISiT_subjects_local CURSOR LOCAL
FOR
	SELECT SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';

OPEN ISiT_subjects_local;
FETCH ISiT_subjects_local into @subject;
PRINT 'Дисциплины кафедры ИСиТ:';
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @subjects = RTRIM(@subject) +', ' +  @subjects;
		FETCH ISiT_subjects_local into @subject;
	END;
	PRINT @subjects;
CLOSE ISiT_subjects_local; 

--GLOBAL
GO
DECLARE @subject char(30), @subjects char(500) ='';
DECLARE ISiT_subjects_global CURSOR GLOBAL
FOR
	SELECT SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';

OPEN ISiT_subjects_global;
FETCH ISiT_subjects_global into @subject;
PRINT 'Дисциплины кафедры ИСиТ:';
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @subjects = RTRIM(@subject) +', ' +  @subjects;
		FETCH ISiT_subjects_global into @subject;
	END;
	PRINT @subjects;
CLOSE ISiT_subjects_global; 

-- #3
-- STATIC
GO
DECLARE @subject char(30), @subjects char(500) ='';
DECLARE ISiT_subjects_static CURSOR LOCAL STATIC 
FOR
	SELECT SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';

OPEN ISiT_subjects_static;
FETCH ISiT_subjects_static into @subject;
PRINT 'Дисциплины кафедры ИСиТ:';
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @subjects = RTRIM(@subject) +', ' +  @subjects;
		FETCH ISiT_subjects_static into @subject;
	END;
	PRINT @subjects;
CLOSE ISiT_subjects_static; 

-- DYNAMIC
GO
DECLARE @subject char(30), @subjects char(500) ='';
DECLARE ISiT_subjects_dynamic CURSOR LOCAL DYNAMIC 
FOR
	SELECT SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';

OPEN ISiT_subjects_dynamic;
FETCH ISiT_subjects_dynamic into @subject;
PRINT 'Дисциплины кафедры ИСиТ:';
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @subjects = RTRIM(@subject) +', ' +  @subjects;
		FETCH ISiT_subjects_dynamic into @subject;
	END;
	PRINT @subjects;
CLOSE ISiT_subjects_dynamic; 

--4
GO
DECLARE @subject char(30), @subjects char(500) ='', @row int = 0;
DECLARE ISiT_subjects_SCROLL cursor local dynamic SCROLL 
FOR
	SELECT
		ROW_NUMBER() over (order by SUBJECT_T),
		SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';

OPEN ISiT_subjects_SCROLL;

FETCH ISiT_subjects_SCROLL INTO @row, @subject;
PRINT 'Next line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';

FETCH LAST FROM ISiT_subjects_SCROLL INTO @row, @subject;
PRINT 'Last line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';

FETCH RELATIVE -1 FROM ISiT_subjects_SCROLL INTO @row, @subject;
PRINT 'Previous line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';

FETCH ABSOLUTE 2 FROM ISiT_subjects_SCROLL INTO @row, @subject;
PRINT 'Second line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';

FETCH ABSOLUTE -2 FROM ISiT_subjects_SCROLL INTO @row, @subject;
PRINT 'Second line from end: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';

--#5
GO
DECLARE @subject char(30), @subjects char(500) ='', @row int = 0;
DECLARE ISiT_subjects_curent cursor local dynamic SCROLL 
FOR
	SELECT
		ROW_NUMBER() over (order by SUBJECT_T),
		SUBJECT_T.SUBJECT_T
	FROM SUBJECT_T
	WHERE SUBJECT_T.PULPIT = 'ИСиТ';


OPEN ISiT_subjects_curent;
FETCH ISiT_subjects_curent into @subject, @subjects;
DELETE SUBJECT_T where CURRENT OF ISiT_subjects_curent;
FETCH ISiT_subjects_curent into @subject, @subjects;
UPDATE SUBJECT_T set PULPIT = 'Кафедра' + PULPIT
WHERE CURRENT OF ISiT_subjects_curent;
CLOSE ISiT_subjects_curent;

--#6
GO
DECLARE @id varchar(10), @name varchar(100), @subj varchar(50), @note varchar(2);
DECLARE PROGRESS_DELETE_CURSOR CURSOR LOCAL DYNAMIC FOR
	SELECT STUDENT.IDSTUDENT, STUDENT.NAME, PROGRESS.SUBJECT_T, PROGRESS.NOTE
	FROM PROGRESS JOIN STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	FOR UPDATE;

OPEN PROGRESS_DELETE_CURSOR
FETCH PROGRESS_DELETE_CURSOR into @id, @name, @subj, @note;

IF(@note < 4)
	BEGIN
		DELETE PROGRESS WHERE CURRENT OF PROGRESS_DELETE_CURSOR;
	END;
PRINT @id + ' - ' + @name + ' - '+ RTRIM(@subj) + ' - ' + @note ;

WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH PROGRESS_DELETE_CURSOR into @id, @name, @subj, @note;
		PRINT @id + ' - ' + @name + ' - '+ RTRIM(@subj) + ' - ' + @note ;
		IF(@note < 4)
			BEGIN
				DELETE PROGRESS WHERE CURRENT OF PROGRESS_DELETE_CURSOR;
			END;
	END;
CLOSE PROGRESS_DELETE_CURSOR;

OPEN PROGRESS_DELETE_CURSOR;
FETCH PROGRESS_DELETE_CURSOR into @id, @name, @subj, @note;
IF (@note <= 9)
	UPDATE PROGRESS SET NOTE += 1 WHERE CURRENT OF PROGRESS_DELETE_CURSOR;

WHILE (@@FETCH_STATUS = 0)
	BEGIN
		FETCH PROGRESS_DELETE_CURSOR into @id, @name, @subj, @note;
		PRINT @id + ' - ' + @name + ' - '+ RTRIM(@subj) + ' - ' + @note ;
		IF (@note <= 9)
			BEGIN
				UPDATE PROGRESS SET NOTE += 1 WHERE CURRENT OF PROGRESS_DELETE_CURSOR;
			END;
	END;
CLOSE PROGRESS_DELETE_CURSOR;