use E_MyBase2
CREATE TABLE ОТДЕЛ
( ID_Отдела int primary key,
  Название_Отдела nvarchar(50),
  Количество_Сотрудников int not null
  );

  CREATE TABLE Сотрудники
( ID_Сотрудника int primary key,
  ID_Отдела int not null foreign key  references ОТДЕЛ (ID_Отдела)

);

CREATE TABLE ТОВАР
	(  ID_Товара int primary key,
	Название_Товара nvarchar(50),
	Описание nvarchar(50)
  ) on FG1;


CREATE TABLE ЧЕК
	(  ID_Чека int primary key,
	   ID_Товара int foreign key  references ТОВАР (ID_Товара),
	   Предельная_сумма real,
	   Потраченная_сумма real,
	   Дата date,
	   Id_Сотрудника int foreign key  references Сотрудники (ID_Сотрудника)
  ) ;

  INSERT into ОТДЕЛ(ID_Отдела, Название_Отдела, Количество_Сотрудников)
  Values (12, 'RedJaba' , 12),
         (23, 'YellowJaba', 3),
		 (34, 'BlueJaba', 14);

  INSERT into Сотрудники ( ID_Сотрудника, ID_Отдела)
  Values (11, 12),
         (22, 23),
		 (33, 34);

		   INSERT into ТОВАР (ID_Товара,Название_Товара, Описание)
  Values (1, 'красная жаба' ,'жаба красная, видимо опасная'),
         (2, 'желтая жаба', 'жаба желтая, видимо солнечная'),
		 (3, 'фиолетовая жаба', 'жаба фиолетовая, просто фиолетовая');


		  INSERT into ЧЕК (  ID_Чека, ID_Товара, Предельная_сумма , Потраченная_сумма,  Дата ,  Id_Сотрудника  ) 
  Values (1, 1, 159, 150, '2022-04-12' , 11),
         (2, 2, 160, 159, '2022-04-05', 22),
		 (3, 3, 100, 100, '2022-12-05', 33);

		 
   UPDATE ЧЕК set Предельная_сумма = Предельная_сумма + 100 Where Потраченная_сумма = 100;