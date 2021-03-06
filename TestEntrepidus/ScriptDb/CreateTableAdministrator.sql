/*
   viernes, 6 de marzo de 20204:30:09
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
CREATE TABLE TestEntrepidus.dbo.Administrator
	(
	Id int NOT NULL IDENTITY (1, 1),
	FirstName varchar(50) NOT NULL,
	Lastname varchar(50) NOT NULL,
	Username varchar(50) NOT NULL,
	Password varchar(150) NOT NULL,
	CreateDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Administrator ADD CONSTRAINT
	PK_Administrator PRIMARY KEY CLUSTERED 
	(
	Username
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Administrator SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Administrator', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Administrator', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Administrator', 'Object', 'CONTROL') as Contr_Per 