
CREATE TABLE  [dbo].[account] (
  [AccNo] INT NOT NULL PRIMARY KEY ,
  [TypeLoan] varchar(40) NOT NULL,
   [Bank_Branch_id] INT FOREIGN KEY REFERENCES[dbo].[bank_branch]([Bank_Branch_id]),
  [Balance] INT NOT NULL
); 


CREATE TABLE   [dbo].[bank] (
  [code] INT NOT NULL PRIMARY KEY,
  [Name] varchar(40) NOT NULL,
  [Addresss] varchar(40) NOT NULL
) ;



CREATE TABLE   [dbo].[bank_branch] (
  
  [Bank_Branch_id] INT NOT NULL ,
  [Address] varchar(40) NOT NULL,
  [code] INT FOREIGN KEY REFERENCES[dbo].[bank]([code]),
  PRIMARY KEY ([Bank_Branch_id])
  
)  ;



CREATE TABLE [dbo].[customer] (
  [SSN] INT NOT NULL PRIMARY KEY,
  [Bank_Branch_id] INT FOREIGN KEY REFERENCES[dbo].[bank]([Bank_Branch_id]),
  [Phone] varchar(15) NOT NULL,
  [Name] varchar(40) NOT NULL,
  [Addresss] varchar(50) NOT NULL
) ;



CREATE TABLE  [dbo].[loan](
  [LoanNo] INT NOT NULL PRIMARY KEY,
  [Amount] INT NOT NULL,
  [type] varchar(40) NOT NULL,
   [Bank_Branch_id] INT FOREIGN KEY REFERENCES[dbo].[bank_branch]([Bank_Branch_id]),
  PRIMARY KEY ([LoanNo])
) ;
CREATE TABLE [dbo].[customer_Account]
(
[AccNo] INT FOREIGN KEY REFERENCES [dbo].[account]([AccNo]),
[SSN] INT  FOREIGN KEY REFERENCES [dbo].[customer]([SSN])
   
);

CREATE TABLE [dbo].[LOAN_CUSTOMER]
(

[LoanNo] INT FOREIGN KEY REFERENCES [dbo].[loan]([LoanNo]),
[SSN] INT  FOREIGN KEY REFERENCES [dbo].[customer]([SSN])
   
);