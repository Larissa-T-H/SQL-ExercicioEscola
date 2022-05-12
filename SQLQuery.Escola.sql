create database bdEscola;
use bdEscola;

create table turma(
	TurmaID int not null primary key identity(1,1),
	Turma varchar (10)
);
insert into Turma (Turma) values ('101'),('102');
select * from Turma;

create table Aluno(
	AlunoID int not null primary key identity(1,1),
	Aluno varchar(10),
	--vincular o campo int pk da tabela origem
	TurmaID int foreign KEY references turma(TurmaID)
);
insert into Aluno (aluno, TurmaID) 
values ('Larissa', 1), ('Jhonatta', 1), ('Theo',2), ('Airi',2);
select * from Aluno;
insert into Turma (Turma) values ('101'),('102');
select * from Turma;

create table Disciplina(
	DisciplinaID int not null primary key identity(1,1),
	Disciplina varchar(10)
);
insert into Disciplina (Disciplina) values ('Mat'), ('Port'), ('Geo'), ('Hist');
select * from Disciplina;

create table Cadastro(
	CadastroID int not null primary key identity(1,1),
	TurmaID int foreign KEY references turma(TurmaID),
	DisciplinaID int foreign KEY references disciplina(DisciplinaID)
);
insert into Cadastro (TurmaID, DisciplinaID) 
values (1, 1), (1, 2), (2,3), (2,4);
select * from Cadastro;

create table Notas(
	notasID int not null primary key identity(1,1),
	CadastroID int foreign KEY references Cadastro(CadastroID),
	AlunoID int foreign KEY references Aluno(AlunoID),
	Bim1 decimal (10,2),
	Bim2 decimal (10,2),
	Bim3 decimal (10,2),
	Bim4 decimal (10,2)
);
insert into Notas (CadastroID, AlunoID, Bim1, Bim2, Bim3, Bim4) 
values (1, 1, 10, 8, 9.5, 10), (1, 2, 9, 8.5, 9.5, 8), 
	   (2, 1, 7.5, 8, 9.5, 10), (2, 2, 9.5, 8.5, 7, 10),
	   (3, 3, 10, 8.5, 9, 7), (3, 4, 9.5, 7, 7.5, 8),
	   (4, 3, 7, 8, 9, 9.5), (4, 4, 10, 8, 9.5, 7);
select * from Notas;

delete from Cadastro where CadastroID=1;

select T.Turma,D.Disciplina, A.Aluno, N.Bim1, N.Bim2, N.Bim3, 
N.Bim4 
from notas as N
inner join Aluno as A
on a.AlunoID = n.AlunoID
inner join turma as T
on t.TurmaID = a.TurmaID
inner join cadastro as C
on C.CadastroID = n.CadastroID
inner join Disciplina as D
on D.DisciplinaID = C.CadastroID
where T.Turma = 101 and D.Disciplina='Mat';