create database libdemo
use libdemo

create table admininfo
(

 username varchar(20) not null,
 adminpassword varchar(20),
  primary key(username)
)
create table Member
(
memberid int IDEntity(1,1) not null,
email varchar(20),
memberpassword varchar(20),
Firstname varchar(20),
Lastname varchar(20),
Dob Date,
gender varchar(6),
username varchar(20) Unique,
primary key(memberid)
)
create table Bookdetails
(
Authorid int,
Bookid int,
publisherid int,

primary key(Bookid,Authorid,publisherid),
Foreign key (Bookid) References Bookinfo(Bookid) on Update cascade on Delete cascade,
Foreign key (Authorid) References Author(Authorid) on Update cascade on Delete cascade,
Foreign key (publisherid) References publisher(publisherid) on Update cascade on Delete cascade

)
create table Author
(
Authorname varchar(10),
Authorid int not null,
primary key(Authorid)
)
create table Penalty
(
penaltyprice int,
memid int not null,
primary key(memid),
Foreign key (memid) References Member(memberid) on Update cascade on Delete cascade
)
create table History
(
Bookid int not null,
memberid int not null,
primary key(Bookid,memberid),
Foreign key (Bookid) References Bookinfo(Bookid) on Update cascade on Delete cascade,
Foreign key (memberid) References Member(memberid) on Update cascade on Delete cascade
)
create table Publisher
(
Publisherid int not null,
Publishername varchar(20),
primary key(Publisherid)
)
create table bookinfo
(
Genre varchar(10),
Bookid int not null,
Bookname varchar(20),
BookDescription varchar(100),
CurrentStock int,
ActualStock int,
Bookimagelink varchar(100)
Primary key(Bookid),
)
create table Bookissue
(
Memberid int not null,
Issuedate date,
Bookid int not null,
duedate date,
primary key(Memberid,Bookid),
Foreign key (Memberid) References Member(memberid) on Update cascade on Delete cascade,
Foreign key (Bookid) References Bookinfo(Bookid) on Update cascade on Delete cascade
)
create table Favourites
(
Memberid  int not null,
Bookid  int not null,
primary key(Memberid,Bookid),
Foreign key (Memberid) References Member(memberid) on Update cascade on Delete cascade,
Foreign key (Bookid) References Bookinfo(Bookid) on Update cascade on Delete cascade
)



select * from admininfo
Select * from Member
Select *from Bookissue
Select * from bookinfo
Select *from Author
Select * from History
Select * from Favourites
Select * from Publisher
Select * from Penalty
Select * from Bookdetails


CREATE TRIGGER updateadprofile
ON admininfo
INSTEAD OF Update 
AS 
BEGIN
	DECLARE @username VARCHAR(20), @pass VARCHAR(20)
	SELECT @username = username FROM INSERTED;
	SELECT @pass = adminpassword FROM INSERTED;
	

	IF(LEN(@pass)<4)
	BEGIN
		raiserror('Password is too Short',16,1);
	END
	ELSE
	BEGIN
		UPDATE admininfo
		SET adminpassword=@pass
		WHERE admininfo.username = @username;
	END
END;


CREATE TRIGGER updatememprofile
ON Member
INSTEAD OF Update 
AS 
BEGIN
Declare @mempass varchar(20),
@memdob varchar(20),
@mememail varchar(20),
@memfname varchar(20),
@memlname varchar(20),
@memusername varchar(20)



	SELECT @mempass = memberpassword FROM INSERTED;
	SELECT @memdob = Dob  FROM INSERTED;
	SELECT @mememail = email  FROM INSERTED;
	SELECT @memfname = Firstname  FROM INSERTED;
	SELECT @memlname = Lastname  FROM INSERTED;
	SELECT @memusername = username  FROM INSERTED;

	

	IF(LEN(@mempass)<4)
	BEGIN
		raiserror('Password is too Short',16,1);
	END
	ELSE
	BEGIN
		UPDATE Member
		SET Dob=@memdob,
			memberpassword=@mempass,
			Firstname=@memfname,
			Lastname=@memlname,
			email=@mememail
		WHERE Member.username = @memusername;
	END
END;

create procedure memprofupdate
@mempass varchar(20),
@memdob varchar(20),
@mememail varchar(20),
@memfname varchar(20),
@memlname varchar(20),
@memusername varchar(20)
As
Begin
UPDATE Member
		SET Dob=@memdob,
			memberpassword=@mempass,
			Firstname=@memfname,
			Lastname=@memlname,
			email=@mememail
		WHERE Member.username = @memusername;
End


CREATE TRIGGER addbooks
ON bookinfo
INSTEAD OF Insert 
AS 
BEGIN
	DECLARE @bookid int,@genre varchar(20),@bookname varchar(20),@bookdescription varchar(100),@curstock int,@actual int,@bookurl varchar(20)
	select @bookid=bookid from INSERTED;
	SELECT @genre =  Genre FROM INSERTED;
	SELECT @bookname =Bookname FROM INSERTED;
	SELECT @bookdescription =  BookDescription FROM INSERTED;
	SELECT @curstock =  CurrentStock FROM INSERTED;
	SELECT @actual =  ActualStock FROM INSERTED;
	SELECT @bookurl =  Bookimagelink FROM INSERTED;
	

	IF Exists(Select bookinfo.Bookid from bookinfo where bookinfo.Bookid=@bookid)
	BEGIN
		raiserror('Bookid already Exists',16,1);
	END
	ELSE
	BEGIN
	Insert into bookinfo(bookid,Genre,Bookname,BookDescription,CurrentStock,ActualStock,Bookimagelink)
	values(@bookid,@genre,@bookname,@bookdescription,@curstock,@actual,@bookurl)
	END
END;

CREATE TRIGGER DeleteBook
ON bookinfo
INSTEAD OF Delete 
AS 
BEGIN
DECLARE @bookid int
SELECT @bookid=Bookid FROM deleted ;
	

	IF Exists(Select bookinfo.Bookid from bookinfo where bookinfo.Bookid=@bookid)
	BEGIN
		Delete from bookinfo
		where bookinfo.Bookid=@bookid
	END
	else
	begin
		raiserror('Book not Found',16,1);
	end
END

CREATE VIEW [displaybooks] AS
select Bookimagelink,Bookname,Bookid 
from bookinfo

create procedure adminupdate
@pass varchar(20),
@username varchar(20)
As
Begin
UPDATE admininfo
SET adminpassword=@pass
WHERE admininfo.username = @username;
End


create procedure signup
@mempass varchar(20),
@memdob varchar(20),
@mememail varchar(20),
@memfname varchar(20),
@memlname varchar(20),
@memusername varchar(20),
@memgender varchar(6)
As
Begin
Insert into Member (username,memberpassword,email,Firstname,Lastname,Dob,gender,Noofbooksissued)
values(@memusername,@mempass,@mememail,@memfname,@memlname,@memdob,@memgender,0)
End


create procedure signin
@usrname Varchar(20),
@passw varchar(20),
@flag int output
As
Begin
if Exists(Select Member.username from Member where Member.username=@usrname and Member.memberpassword=@passw)
begin
set @flag=1
end
else
begin
 set @flag=0
end
End

CREATE VIEW [getfavourites] AS
Select Genre,Favourites.Memberid,bookinfo.Bookid,Bookname,Bookimagelink from bookinfo
join Favourites
on Favourites.Bookid=bookinfo.Bookid


CREATE FUNCTION getfavouritesfunc(@userid int)
RETURNS Table
AS
RETURN select * from getfavourites where Memberid=@userid

CREATE FUNCTION gethistorybooks(@userid int)
RETURNS Table
AS
RETURN select bookinfo.Bookname,bookinfo.Bookimagelink from bookinfo join
History on
bookinfo.Bookid=History.Bookid
where History.memberid=@userid


CREATE FUNCTION getmemid(@username varchar(50))
RETURNS int
AS
BEGIN
Declare @returnvalue int
Select @returnvalue=Member.memberid from Member where Member.username=@username
RETURN @returnvalue
END

CREATE FUNCTION getpenaltypice(@username int)
RETURNS int
AS
BEGIN
Declare @returnvalue int
Select @returnvalue=Penalty.penaltyprice from Penalty where Penalty.memid=@username
RETURN @returnvalue
END

CREATE FUNCTION getcurrentstock(@bkid int)
RETURNS int
AS
BEGIN
Declare @returnvalue int
Select @returnvalue=bookinfo.CurrentStock from bookinfo where bookinfo.Bookid=@bkid
RETURN @returnvalue
END


CREATE FUNCTION getimagelink(@bkid int)
RETURNS varchar(50)
AS
BEGIN
Declare @returnvalue varchar(50)
Select @returnvalue=bookinfo.Bookimagelink from Bookinfo where bookinfo.Bookid=@bkid
RETURN @returnvalue
END


CREATE FUNCTION getAuthorid(@Authorname varchar(20))
RETURNS int
AS
BEGIN
Declare @returnvalue int
Select @returnvalue=Author.Authorid from Author where Author.Authorname=@Authorname
RETURN @returnvalue
END

CREATE FUNCTION getpublisherid(@pubname varchar(20))
RETURNS int
AS
BEGIN
Declare @returnvalue int
Select @returnvalue=Publisher.publisherid from Publisher where Publisher.Publishername=@pubname
RETURN @returnvalue
END

CREATE TRIGGER issuebook
ON Bookissue
INSTEAD OF insert
AS 
BEGIN
DECLARE @bid int, @memberid int
SELECT @bid=Bookid FROM inserted ;
SELECT @memberid=Memberid FROM inserted ;
IF Exists(Select Bookissue.Bookid from Bookissue where Bookissue.Bookid=@bid and Bookissue.Memberid=@memberid)
	BEGIN
		raiserror('Book is already issued',16,1);
	END
	else
	begin
		Insert into Bookissue(Memberid,Issuedate,Bookid,duedate)
		values(@memberid,GETDATE(),@bid,Getdate()+10)
		update bookinfo
		set CurrentStock=CurrentStock-1
		where bookinfo.Bookid=@bid
	end
END

CREATE procedure Returnbook
@bid int, 
@memberid int
AS 
BEGIN
IF Exists(Select Bookissue.Bookid from Bookissue where Bookissue.Bookid=@bid and Bookissue.Memberid=@memberid)
	BEGIN
	Delete from Bookissue
	where Bookissue.Bookid=@bid and Bookissue.Memberid=@memberid
		update bookinfo
		set CurrentStock=CurrentStock+1
		where bookinfo.Bookid=@bid
		insert into History(Bookid,memberid)
		values(@bid,@memberid)
	END
	else
	begin
		raiserror('You have not issued this book',16,1);
	end
END


create procedure Renewabook
@memberid int,
@bid int
As
BEGIN
if Exists(Select Bookissue.Bookid from Bookissue where Bookissue.Bookid=@bid and Bookissue.Memberid=@memberid)
Begin
update Bookissue
set Issuedate=GETDATE(),
	duedate=GETDATE()+12
where Bookissue.Bookid=@bid and Bookissue.Memberid=@memberid
End
else
begin
		raiserror('You have not issued this book',16,1);
end
END


create procedure issueabook
@memberid int,
@bid int
As
Begin
Insert into Bookissue(Memberid,Issuedate,Bookid,duedate)
values(@memberid,GETDATE(),@bid,Getdate()+10)
End

create procedure addtofav
@usrname Varchar(20),
@bid int
As
Begin
declare @id int
select @id=dbo.getmemid(@usrname)
Insert into Favourites(Memberid,Bookid)
values(@id,@bid)
End

create procedure remfromfav
@usrname Varchar(20),
@bid int
As
Begin
declare @id int
select @id=dbo.getmemid(@usrname)
delete from Favourites
where Bookid=@bid and Memberid=@id
End

create procedure updateprice
@price int,
@memid int
As
Begin
Update Penalty
set penaltyprice=@price
where memid=@memid
End

create procedure insertprice
@price int,
@memid int
As
Begin
insert into Penalty(memid,penaltyprice)
values(@memid,@price)
End




CREATE FUNCTION searchbooks(@bookname varchar(50))
RETURNS Table
AS
RETURN Select * from bookinfo where bookinfo.Bookname like '%' + @bookname + '%' 


CREATE view [sortbyasc]
As
Select * from bookinfo;


CREATE FUNCTION issuedbooks(@userid int)
RETURNS Table
AS
RETURN Select Bookname,duedate,Bookimagelink,Bookissue.Bookid from Bookissue join bookinfo on bookinfo.Bookid=Bookissue.Bookid
where Bookissue.Memberid=@userid



CREATE FUNCTION booksbygenre(@bookgenre varchar(50))
RETURNS Table
AS
RETURN Select * from bookinfo where bookinfo.Genre=@bookgenre 



CREATE FUNCTION getbookdetail(@bookid int)
RETURNS Table
AS
RETURN Select Genre,bookinfo.Bookid,Authorname,Publishername,Bookname,CurrentStock,ActualStock,BookDescription,Bookimagelink from bookinfo
join Bookdetails on Bookdetails.Bookid=bookinfo.Bookid
join Author on Author.Authorid=Bookdetails.Authorid
join Publisher on Publisher.publisherid=Bookdetails.publisherid
where bookinfo.Bookid=@bookid

CREATE FUNCTION getpenaltytable(@memid int)
RETURNS Table
AS
RETURN Select (datediff(day,Bookissue.duedate,GETDATE())) as prices from bookissue where Bookissue.Memberid=@memid


create procedure adminsignin
@usrname Varchar(20),
@passw varchar(20),
@flag int output
As
Begin
if Exists(Select admininfo.username from admininfo where admininfo.username=@usrname and admininfo.adminpassword=@passw)
begin
set @flag=1
end
else
begin
 set @flag=0
end
End

create procedure checkifbookidexists
@bkid int,
@flag int output
As
Begin
if Exists(Select bookinfo.Bookid from bookinfo where bookinfo.Bookid=@bkid)
begin
set @flag=1
end
else
begin
 set @flag=0
end
End

create procedure checkifmemexist
@memid int,
@flag int output
As
Begin
if Exists(Select Penalty.memid from Penalty where Penalty.memid=@memid)
begin
set @flag=1
end
else
begin
 set @flag=0
end
End



create procedure addbookspro
@bookid int,
@genre varchar(20),
@bookname varchar(20),
@bookdescription varchar(100),
@curstock int,
@actual int,
@bookurl varchar(20),
@authorname varchar(20),
@publishername varchar(20)
As
Begin
IF Exists(Select bookinfo.Bookid from bookinfo where bookinfo.Bookid=@bookid)
	BEGIN
		raiserror('Bookid already Exists',16,1);
	END
Else
Begin
Insert into bookinfo(bookid,Genre,Bookname,BookDescription,CurrentStock,ActualStock,Bookimagelink)
	values(@bookid,@genre,@bookname,@bookdescription,@curstock,@actual,@bookurl)
declare @Auid int
declare @pubid int
select @Auid=dbo.getAuthorid(@authorname)
if(@Auid is null)
Begin
	insert into Author(Authorname)
	values(@authorname)
	select @Auid=Author.Authorid from Author where Author.Authorname=@authorname
End
select @pubid=dbo.getpublisherid(@publishername)
if(@pubid is null)
Begin
	insert into Publisher(Publishername)
	values(@publishername)
	select @pubid=Publisher.publisherid from Publisher where Publisher.Publishername=@publishername
End
Insert into Bookdetails(Authorid,Bookid,publisherid)
	values(@Auid,@bookid,@pubid)
End
End


create procedure upbookspro
@bookid int,
@genre varchar(20),
@bookname varchar(20),
@bookdescription varchar(100),
@curstock int,
@actual int,
@bookurl varchar(20),
@authorname varchar(20),
@publishername varchar(20)
As
Begin
IF Exists(Select bookinfo.Bookid from bookinfo where bookinfo.Bookid=@bookid)
Begin
	UPDATE bookinfo
	SET Genre =@genre, 
       Bookname =@bookname,
	   BookDescription=@bookdescription,
	   CurrentStock=@curstock,
	   ActualStock=@actual,
	   Bookimagelink=@bookurl
	where bookinfo.Bookid=@bookid
declare @Auid int
declare @pubid int
select @Auid=dbo.getAuthorid(@authorname)
if(@Auid is null)
Begin
	insert into Author(Authorname)
	values(@authorname)
	select @Auid=Author.Authorid from Author where Author.Authorname=@authorname
End



select @pubid=dbo.getpublisherid(@publishername)
if(@pubid is null)
Begin
	insert into Publisher(Publishername)
	values(@publishername)
	select @pubid=Publisher.publisherid from Publisher where Publisher.Publishername=@publishername
End
   update Bookdetails
   set Authorid=@Auid,
	publisherid=@pubid
   where Bookid=@bookid
 End
else
begin
	raiserror('Bookid not Found',16,1);
end
END


create procedure deletebookadmin
@bid int
As
Begin
Delete from bookinfo
where bookinfo.Bookid=@bid
End