USE [SocialDb]
GO
/****** Object:  Trigger [dbo].[AddFriend]    Script Date: 2.06.2022 16:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER trigger [dbo].[AddFriend] 

on [dbo].[Friendship]

instead of insert 

as 
begin 
		declare @sourceId int , @targetId int ,@status bit
		select @sourceId = d.sourceId , @targetId = d.targetId ,@status=d.status from inserted d
		insert into FriendshipApprove values(@sourceId,@targetId,@status)



end