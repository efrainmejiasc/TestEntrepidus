/*
   miércoles, 11 de marzo de 202011:04:34
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
CREATE TABLE TestEntrepidus.dbo.LogConnection
	(
	Id int NOT NULL IDENTITY (1, 1),
	IdAdministrator int NOT NULL,
	ConnetionDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.LogConnection ADD CONSTRAINT
	PK_LogConnection PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.LogConnection SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LogConnection', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LogConnection', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LogConnection', 'Object', 'CONTROL') as Contr_Per 