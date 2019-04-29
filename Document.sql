create table tbl_ipl_matches(
match_id number,
team_one_id number,
team_one_name varchar2(50),
team_one_shname varchar2(10),
team_two_id number,
team_two_name varchar2(50),
team_two_shname varchar2(10),
team_one_runs number,
team_one_wicket number,
team_one_over number(5,1),
team_two_runs number,
team_two_wicket number,
team_two_over number(5,1),
dls_flag number,
result varchar2(70)
);

create table league_ipl_table(
team_name varchar2(50),
t_plyd number default 0,
win number default 0,
lose number default 0,
tie number default 0,
NR number default 0,
pts number default 0,
NRR number(4,2) default 0);

Insert into league_ipl_table values ('Sunrisers Hyderabad',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Chennai Super Kings',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Kolkata Knight Riders',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Rajasthan Royals',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Mumbai Indians',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Royal Challengers Bangalore',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Kings XI Punjab',0,0,0,0,0,0,0);
Insert into league_ipl_table values ('Delhi Daredevils',0,0,0,0,0,0,0);

CREATE SEQUENCE seq_ipl_matches
  MINVALUE 1
  MAXVALUE 100
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

create or replace procedure sp_insert_match_results(
p_match_id number,
p_team_one_id number,
p_team_one_name varchar2,
p_team_one_shname varchar2,
p_team_two_id number,
p_team_two_name varchar2,
p_team_two_shname varchar2,
p_team_one_runs number,
p_team_one_wicket number,
p_team_one_over number,
p_team_two_runs number,
p_team_two_wicket number,
p_team_two_over number,
p_dls_flag number)
is 
v_won varchar2(50);
v_lose varchar2(50);
v_result varchar2(75);
nrr_team_one float;
nrr_team_two float;
begin 
update league_ipl_table set t_plyd = t_plyd + 1 where team_name = p_team_one_name;
update league_ipl_table set t_plyd = t_plyd + 1 where team_name = p_team_two_name;

if p_dls_flag = 0 then
 if p_team_one_runs > p_team_two_runs then v_result := ''||p_team_one_name|| ' won by '||(p_team_one_runs - p_team_two_runs)||' runs ';
 update league_ipl_table set win = win + 1, pts = pts+2  where team_name = p_team_one_name;
 update league_ipl_table set lose = lose + 1 where team_name = p_team_two_name;
 elsif p_team_one_runs < p_team_two_runs then v_result:= ''||p_team_two_name ||' won by '||(10-p_team_two_wicket)||' wickets ';
 update league_ipl_table set win = win +1, pts = pts+2 where team_name = p_team_two_name;
 update league_ipl_table set lose = lose + 1 where team_name = p_team_one_name;
 end if;
elsif p_dls_flag = 1 then 

end if;


insert into tbl_ipl_matches values (p_match_id,p_team_one_id,p_team_one_name,p_team_one_shname,p_team_two_id,p_team_two_name,p_team_two_shname,
p_team_one_runs,p_team_one_wicket,p_team_one_over,p_team_two_runs,p_team_two_wicket,p_team_two_over,p_dls_flag,v_result);
end;
/
select * from tbl_ipl_matches;
select * from league_ipl_table;
truncate table tbl_ipl_matches;
truncate table league_ipl_table;

--inserting match info table
exec sp_insert_match_results(1,5,'Mumbai Indians','MI',1,'Chennai Super Kings','CSK',165,4,20,169,9,19.5,0);
exec sp_insert_match_results(2,2,'Delhi Daredevils','DD',3,'Kings XI Punjab','KXIP',166,7,20,167,4,18.5,0);

exec sp_insert_match_results(3,7,'Royal Challengers Bangalore','RCB',4,'Kolkata Knight Riders','KKR',176,7,20 ,177,6,18.5,0);

exec sp_insert_match_results(4,6,'Rajasthan Royals','RR',8,'Sunrisers Hyderabad','SRH',125,9,20,127,1,15.5,0);

exec sp_insert_match_results(5,4,'Kolkata Knight Riders','KKR',1,'Chennai Super Kings','CSK',202,6,20,205,5, 19.5,0);

exec sp_insert_match_results(6,6,'Rajasthan Royals','RR',2,'Delhi Daredevils','DD',153,5, 17.5,60,4,6,1);

exec sp_insert_match_results(7,5,'Mumbai Indians','MI',8,'Sunrisers Hyderabad','SRH',147,8,20,151,9,20,0);

exec sp_insert_match_results(8,3,'Kings XI Punjab','KXIP',7,'Royal Challengers Bangalore','RCB',155,10,19.2,159,6,19.3,0);

exec sp_insert_match_results(9,5,'Mumbai Indians','MI',2,'Delhi Daredevils','DD',194,7,20,195,3,20,0);

exec sp_insert_match_results(10,4,'Kolkata Knight Riders','KKR',8,'Sunrisers Hyderabad','SRH',138,8,20,139,5,19,0);

exec sp_insert_match_results(11,6,'Rajasthan Royals','RR',7,'Royal Challengers Bangalore','RCB',217,4,20,198,6,20,0);

exec sp_insert_match_results(12,3,'Kings XI Punjab','KXIP',1,'Chennai Super Kings','CSK',197,7,20,193,5,20,0);

exec sp_insert_match_results(13,4,'Kolkata Knight Riders','KKR',2,'Delhi Daredevils','DD',200,9,20,129,10,14.2,0);

exec sp_insert_match_results(14,5,'Mumbai Indians','MI',7,'Royal Challengers Bangalore','RCB',213,6,20,167,8,20,0);

exec sp_insert_match_results(15,6,'Rajasthan Royals','RR',4,'Kolkata Knight Riders','KKR',160,8,20,163,3,18.5,0);

exec sp_insert_match_results(16,3,'Kings XI Punjab','KXIP',8,'Sunrisers Hyderabad','SRH',193,3,20,178,4,20,0);

exec sp_insert_match_results(17,1,'Chennai Super Kings','CSK',6,'Rajasthan Royals','RR',204,5,20,140,10,18.3,0);

exec sp_insert_match_results(18,4,'Kolkata Knight Riders','KKR',3,'Kings XI Punjab','KXIP',191,7,20,126,1,11.1,1);

exec sp_insert_match_results(19,2,'Delhi Daredevils','DD',7,'Royal Challengers Bangalore','RCB',174,5,20,176,4,18,0);

exec sp_insert_match_results(20,1,'Chennai Super Kings','CSK',8,'Sunrisers Hyderabad','SRH',182,3,20,178,6,20,0);

exec sp_insert_match_results(21,5,'Mumbai Indians','MI',6,'Rajasthan Royals','RR',167,7,20,168,7,19.4,0);

exec sp_insert_match_results(22,3,'Kings XI Punjab','KXIP',2,'Delhi Daredevils','DD',143,8,20,139,8,20,0);

exec sp_insert_match_results(23,8,'Sunrisers Hyderabad','SRH',5,'Mumbai Indians','MI',118,10,18.4,87,10,18.5,0);

exec sp_insert_match_results(24,7,'Royal Challengers Bangalore','RCB',1,'Chennai Super Kings','CSK',205,8,20,207,5,19.4,0);

exec sp_insert_match_results(25,8,'Sunrisers Hyderabad','SRH',3,'Kings XI Punjab','KXIP',132,6,20,119,10,19.2,0);

exec sp_insert_match_results(26,2,'Delhi Daredevils','DD',4,'Kolkata Knight Riders','KKR',219,4,20,164,9,20,0);

exec sp_insert_match_results(27,1,'Chennai Super Kings','CSK',5,'Mumbai Indians','MI',169,5,20,170,2,19.4,0);

exec sp_insert_match_results(28,8,'Sunrisers Hyderabad','SH',6,'Rajasthan Royals','RR',151,7,20,140,6,20,0);

exec sp_insert_match_results(29,7,'Royal Challengers Bangalore','RCB',4,'Kolkata Knight Riders','KKR',175,4,20,176,4,19.1,0);

exec sp_insert_match_results(30,1,'Chennai Super Kings','CSK',2,'Delhi Daredevils','DD',211,4,20,198,5,20,0);

exec sp_insert_match_results(31,7,'Royal Challengers Bangalore','RCB',5,'Mumbai Indians','MI',167,7,20,153,7,20,0);

exec sp_insert_match_results(32,2,'Delhi Daredevils','DD',6,'Rajasthan Royals','RR',196,6,17.1,146,5,12,1);

exec sp_insert_match_results(33,1,'Chennai Super Kings','CSK',4,'Kolkata Knight Riders','KKR',177,5 ,20 ,180,4 ,17.4 ,0);

exec sp_insert_match_results(34,3,'Kings XI Punjab','KXIP',5,'Mumbai Indians','MI',174,6 ,20 ,176,4,19,0);

exec sp_insert_match_results(35,7,'Royal Challengers Bangalore','RCB',1,'Chennai Super Kings','CSK',127,9,20,128,4,18,0);

exec sp_insert_match_results(36,2,'Delhi Daredevils','DD',8,'Sunrisers Hyderabad','SRH',163,5,20,164,3,19.5 ,0);

exec sp_insert_match_results(37,5,'Mumbai Indians','MI',4,'Kolkata Knight Riders','KRR',181,4,20,168,6,20 ,0);

exec sp_insert_match_results(38,6,'Rajasthan Royals','RR',3,'Kings XI Punjab','KXIP',152,9,20,155,4,18.4,0);

exec sp_insert_match_results(39,8,'Sunrisers Hyderabad','SRH',7,'Royal Challengers Bangalore','RCB',146,10,20,141,6,20,0);

exec sp_insert_match_results(40,6,'Rajasthan Royals','RR',3,'Kings XI Punjab','KXIP',158,8,20,143,7,20 ,0);

exec sp_insert_match_results(41,5,'Mumbai Indians','MI',4,'Kolkata Knight Riders','KKR',210,6,20,108,10,18.1,0);

exec sp_insert_match_results(42,2,'Delhi Daredevils','DD',8,'Sunrisers Hyderabad','SRH',187,5,20 ,191,1, 18.5,0);

exec sp_insert_match_results(43,1,'Chennai Super Kings','CSK',6,'Rajasthan Royals','RR',176,4,20,177,6, 19.5 ,0);

exec sp_insert_match_results(44,4,'Kolkata Knight Riders','KKR',3,'Kings XI Punjab','KXIP',245,6,20,214,8,20,0);

exec sp_insert_match_results(45,2,'Delhi Daredevils','DD',7,'Royal Challengers Bangalore','RCB',181,4,20,187,5,19 ,0);

exec sp_insert_match_results(46,8,'Sunrisers Hyderabad','SRH',1,'Chennai Super Kings','CSK',179,4 ,20 ,180,2, 19,0);

exec sp_insert_match_results(47,5,'Mumbai Indians','MI',6,'Rajasthan Royals','RR',168,6,20 ,171,3 ,18,0);

exec sp_insert_match_results(48,3,'Kings XI Punjab','KXIP',7,'Royal Challengers Bangalore','RCB',88,10,15.1,92,0,8.1,0);

exec sp_insert_match_results(49,6,'Rajasthan Royals','RR',4,'Kolkata Knight Riders','KKR',142,10,19,145,4,18 ,0);

exec sp_insert_match_results(50,5,'Mumbai Indians','MI',3,'Kings XI Punjab','KXIP',186,8,20 ,183,5,20,0);

exec sp_insert_match_results(51,7,'Royal Challengers Bangalore','RCB',8,'Sunrisers Hyderabad','SRH',218,6,20,204,3,20 ,0);

exec sp_insert_match_results(52,2,'Delhi Daredevils','DD',1,'Chennai Super Kings','CSK',162,5,20,128,6,20 ,0);

exec sp_insert_match_results(53,6,'Rajasthan Royals','RR',7,'Royal Challengers Bangalore','RCB',164,5,20,134,10,19.2,0);

exec sp_insert_match_results(54,8,'Sunrisers Hyderabad','SRH',4,'Kolkata Knight Riders','KKR',172,9,20 ,173,5,19.4,0);

exec sp_insert_match_results(55,2,'Delhi Daredevils','DD',5,'Mumbai Indians','MI',174,4,20,163,10,19.3,0);

exec sp_insert_match_results(56,3,'Kings XI Punjab','KXIP',1,'Chennai Super Kings','CSK',153,10,19.4,159,5,19.1,0);



}
 