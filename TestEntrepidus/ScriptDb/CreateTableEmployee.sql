/*
   viernes, 6 de marzo de 20204:20:08
   Usuario: sa
   Servidor: EMCSERVERI7
   Base de datos: TestEntrepidus
   Aplicación: 
*/

/* Para evitar posibles problemas de pérdida de datos, debe revisar este script detalladamente antes de ejecutarlo fuera del contexto del diseñador de base de datos.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE TestEntrepidus.dbo.Employee
	(
	Id int NOT NULL IDENTITY (1, 1),
	IdentificationNumber varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Direccion varchar(150) NOT NULL,
	Email varchar(50) NOT NULL,
	Phone varchar(30) NOT NULL,
	ContractDate datetime NOT NULL,
	BirthDate datetime NOT NULL,
	FreeLance bit NOT NULL,
	Rate float(53) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT
	PK_Employee PRIMARY KEY CLUSTERED 
	(
	IdentificationNumber
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Employee', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'CONTROL') as Contr_Per 