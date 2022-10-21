CREATE TABLE [Application].[Session] (
   [Session_ID]             VARCHAR(40) NOT NULL,
   [Session_Type_ID]        VARCHAR(30) NULL,
   [Session_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),

   [Referral_ID]            VARCHAR(40) NULL,
   [Case_ID]                VARCHAR(40) NULL,

   
    -- external reference - Officer relationship 
   [Officer_ID]             VARCHAR(40) NULL,

    -- external reference - Contact relationship
   [Contact_ID]             VARCHAR(40) NULL,

    -- Session relationship 
   [Token_ID]               VARCHAR(40) NULL,
  
   CONSTRAINT fk_AccessToken_Session FOREIGN KEY ([Token_ID])
      REFERENCES [Application].[AccessToken]([Token_ID]),

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(40) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime]  DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67'

   CONSTRAINT [pk_Session] PRIMARY KEY CLUSTERED ([Session_ID] ASC),
   CONSTRAINT [fk_Application_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [fk_Application_Referral] FOREIGN KEY ([Referral_ID]) 
      REFERENCES [Management].[Referral] ([Referral_ID]),
   CONSTRAINT [fk_Application_Contact] FOREIGN KEY (Contact_ID)
      REFERENCES [Entity].[Contact] ([Contact_ID])
);
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'If not case id then add person information', 
   @level0type = N'SCHEMA',   @level0name = N'Application',
   @level1type = N'TABLE',    @level1name = N'Session';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Follow-up',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Session', 
   @level2type = N'COLUMN',   @level2name = 'Session_Type_ID';

