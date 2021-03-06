USE [SocialDb]
GO
/****** Object:  Trigger [dbo].[OldMessage]    Script Date: 2.06.2022 17:00:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[OldMessage]

on [dbo].[UserMessage] 

after update

as 

begin 

	declare @message varchar(500), @type nchar(10), @createdAt Datetime
	
	select @message=d.message, @type= d.type, @createdAt=d.createdAt from deleted d

	insert into  MessageArchive values ( @message,@createdAt,@type) 

end

