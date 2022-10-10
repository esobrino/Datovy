CREATE TABLE [Healthcare].[Laboratory_Result] (
   [Lab_Result_ID]         VARCHAR(30) NOT NULL,
   [Laboratory_ID]         VARCHAR(30) NULL,
   [Lab_Result_DateTime]   DATETIME2(7) NULL,
   [Result_Value]          DECIMAL(18, 5) NULL,
   [Result_Unit]           VARCHAR(50) NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL,
   [Version_Number]        VARCHAR(20),
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Laboratory_Result] PRIMARY KEY CLUSTERED ([Lab_Result_ID] ASC),
   CONSTRAINT [FK_Laboratory_Result_Laboratory] FOREIGN KEY ([Laboratory_ID]) 
      REFERENCES [Healthcare].[Laboratory] ([Laboratory_ID])
);
GO


