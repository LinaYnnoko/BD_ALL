use E_MyBase2
CREATE TABLE �����
( ID_������ int primary key,
  ��������_������ nvarchar(50),
  ����������_����������� int not null
  );

  CREATE TABLE ����������
( ID_���������� int primary key,
  ID_������ int not null foreign key  references ����� (ID_������)

);

CREATE TABLE �����
	(  ID_������ int primary key,
	��������_������ nvarchar(50),
	�������� nvarchar(50)
  ) on FG1;


CREATE TABLE ���
	(  ID_���� int primary key,
	   ID_������ int foreign key  references ����� (ID_������),
	   ����������_����� real,
	   �����������_����� real,
	   ���� date,
	   Id_���������� int foreign key  references ���������� (ID_����������)
  ) ;

  INSERT into �����(ID_������, ��������_������, ����������_�����������)
  Values (12, 'RedJaba' , 12),
         (23, 'YellowJaba', 3),
		 (34, 'BlueJaba', 14);

  INSERT into ���������� ( ID_����������, ID_������)
  Values (11, 12),
         (22, 23),
		 (33, 34);

		   INSERT into ����� (ID_������,��������_������, ��������)
  Values (1, '������� ����' ,'���� �������, ������ �������'),
         (2, '������ ����', '���� ������, ������ ���������'),
		 (3, '���������� ����', '���� ����������, ������ ����������');


		  INSERT into ��� (  ID_����, ID_������, ����������_����� , �����������_�����,  ���� ,  Id_����������  ) 
  Values (1, 1, 159, 150, '2022-04-12' , 11),
         (2, 2, 160, 159, '2022-04-05', 22),
		 (3, 3, 100, 100, '2022-12-05', 33);

		 
   UPDATE ��� set ����������_����� = ����������_����� + 100 Where �����������_����� = 100;