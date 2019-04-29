--table for team info
create table tbl_ipl_ayush(
  team_id NUMBER,
  team_name varchar2(50),
  sh_name varchar2(5)
)

--table for match info
create table tbl_ipl_matches_ayush(
match_id number,
team_one_id number,
team_one_runs number,
team_one_wicket number,
team_one_over number(5,1),
team_two_id number,
team_two_runs number,
team_two_wicket number,
team_two_over number(5,1),
dls_flag number,
winner_team_id number,
result varchar2(70),
match_tag VARCHAR2(5),
home_team_id NUMBER,
away_team_id number
);


INSERT INTO tbl_ipl_ayush values (1,'Chennai Super kings','CSK');
INSERT INTO tbl_ipl_ayush VALUES (2,'Delhi Daredevils','DD');
INSERT INTO tbl_ipl_ayush VALUES (3,'Kings XI Punjab','KXIP');
INSERT INTO tbl_ipl_ayush VALUES (4,'Kolkata Knight Riders','KKR');
INSERT INTO tbl_ipl_ayush VALUES (5,'Mumbai Indians','MI');
INSERT INTO tbl_ipl_ayush VALUES (6,'Rajasthan Royals','RR');
INSERT INTO tbl_ipl_ayush VALUES (7,'Royal Challengers Banglalore','RCB');
INSERT INTO tbl_ipl_ayush VALUES (8,'Sunrisers Hyberabad','SRH');

DROP SEQUENCE seq_ipl_matches;

--sequence for match_id
 CREATE SEQUENCE seq_ipl_matches
  MINVALUE 1
  MAXVALUE 100
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

--procedure for inserting values to match info table
create or replace procedure sp_insert_match_results(
p_match_id number,
p_team_one_id number,
p_team_one_runs number,
p_team_one_wicket number,
p_team_one_over number,
p_team_two_id number,
p_team_two_runs number,
p_team_two_wicket number,
p_team_two_over number,
p_dls_flag NUMBER,
p_match_tag VARCHAR2,
p_home_team number)
is
v_team_one_name varchar2(50);
v_team_two_name varchar2(50);
v_winner_id number;
v_away_id number;
v_result varchar2(75);

begin
    select team_name into v_team_one_name from tbl_ipl_ayush where team_id = p_team_one_id;
    select team_name into v_team_two_name from tbl_ipl_ayush where team_id = p_team_two_id;

    if p_team_one_runs > p_team_two_runs then v_result := ''||v_team_one_name|| ' won by '||(p_team_one_runs - p_team_two_runs)||' runs ';
    v_winner_id := p_team_one_id;
    elsif p_team_one_runs < p_team_two_runs then v_result:= ''||v_team_two_name ||' won by '||(10-p_team_two_wicket)||' wickets ';
    v_winner_id := p_team_two_id;
    end if;
    if p_dls_flag = 1 then v_result := v_result||'(DLS method)';
    end if;
    if p_team_one_id = p_home_team then v_away_id := p_team_two_id;
    else v_away_id := p_team_one_id;
    end if;
     insert into tbl_ipl_matches_ayush values (p_match_id,p_team_one_id,p_team_one_runs,p_team_one_wicket,p_team_one_over,p_team_two_id,p_team_two_runs,p_team_two_wicket,p_team_two_over,p_dls_flag,v_winner_id,v_result,p_match_tag,p_home_team,v_away_id);
end;
/
  TRUNCATE TABLE tbl_ipl_matches_ayush;
  --insertion of match info
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,165,4,20,1,169,9,19.5,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,166,7,20,3,167,4,18.5,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,7,176,7,20,4,177,6,18.5,0,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,125,9,20,8,127,1,15.5,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,4,202,6,20,1,205,5,19.5,0,'L',1);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,70,5,6.0,2,60,4,6,1,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,147,8,20,8,151,9,20,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,155,10,19.2,7,159,6,19.3,0,'L', 7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,194,7,20,2,195,3,20,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,4,138,8,20,8,139,5,19,0,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,217,4,20,7,198,6,20,0,'L',7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,197,7,20,1,193,5,20,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,4,200,9,20,2,129,10,14.2,0,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,213,6,20,7,167,8,20,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,160,8,20,4,163,3,18.5,0,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,193,3,20,8,178,4,20,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,1,204,5,20,6,140,10,18.3,0,'L',1);
exec sp_insert_match_results(seq_ipl_matches.nextVal,4,124,7,13,3,126,1,11.1,1,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,174,5,20,7,176,4,18,0,'L',7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,1,182,3,20,8,178,6,20,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,167,7,20,6,168,7,19.4,0,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,143,8,20,2,139,8,20,0,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,118,10,18.4,5,87,10,18.5,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,7,205,8,20,1,207,5,19.4,0,'L',7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,132,6,20,3,119,10,19.2,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,219,4,20,4,164,9,20,0,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,1,169,5,20,5,170,2,19.4,0,'L',1);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,151,7,20,6,140,6,20,0,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,7,175,4,20,4,176,4,19.1,0,'L',7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,1,211,4,20,2,198,5,20,0,'L',1);
exec sp_insert_match_results(seq_ipl_matches.nextVal,7,167,7,20,5,153,7,20,0,'L',7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,150,6,12.0,6,146,5,12,1,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,1,177,5,20,4,180,4,17.4,0,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,174,6,20,5,176,4,19,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,7,127,9,20,1,128,4,18,0,'L',1);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,163,5,20,8,164,3,19.5,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,181,4,20,4,168,6,20,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,152,9,20,3,155,4,18.4,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,146,10,20,7,141,6,20,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,158,8,20,3,143,7,20,0,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,210,6,20,4,108,10,18.1,0,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,187,5,20,8,191,1,18.5,0,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,1,176,4,20,6,177,6,19.5,0,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,4,245,6,20,3,214,8,20,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,181,4,20,7,187,5,19,0,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,179,4,20,1,180,2,19,0,'L',1);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,168,6,20,6,171,3,18,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,88,10,15.1,7,92,0,8.1,0,'L',3);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,142,10,19,4,145,4,18,0,'L',4);
exec sp_insert_match_results(seq_ipl_matches.nextVal,5,186,8,20,3,183,5,20,0,'L',5);
exec sp_insert_match_results(seq_ipl_matches.nextVal,7,218,6,20,8,204,3,20,0,'L',7);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,162,5,20,1,128,6,20,0,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,6,164,5,20,7,134,10,19.2,0,'L',6);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,172,9,20,4,173,5,19.4,0,'L',8);
exec sp_insert_match_results(seq_ipl_matches.nextVal,2,174,4,20,5,163,10,19.3,0,'L',2);
exec sp_insert_match_results(seq_ipl_matches.nextVal,3,153,10,19.4,1,159,5,19.1,0,'L',1);


--last four matches
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,139,7,20,1,140,8,19.1,0, 'Q1',0);
exec sp_insert_match_results(seq_ipl_matches.nextVal,4,169,7,20,6,144,4,20,0, 'E',0);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,174,7,20,4,160,9,20,0, 'Q2',0);
exec sp_insert_match_results(seq_ipl_matches.nextVal,8,178,6,20,1,181,2,18.3,0, 'F',0);

SELECT * FROM  tbl_ipl_matches_ayush;
SELECT * FROM tbl_ipl_ayush;

--function to calculate total played
CREATE OR REPLACE FUNCTION fn_played (p_team_id IN  NUMBER)
RETURN NUMBER IS
pld NUMBER(5):=0;
BEGIN
SELECT Count(*) into pld FROM tbl_ipl_matches_ayush WHERE (team_one_id = p_team_id OR team_two_id = p_team_id) and match_tag = 'L' ;
RETURN pld;
END;
/

--function to calculate wins
CREATE OR REPLACE FUNCTION fn_wins(p_team_id  IN number)
RETURN NUMBER IS
win NUMBER(5) := 0;
BEGIN
   SELECT Count(*) INTO win
   FROM tbl_ipl_matches_ayush
   WHERE winner_team_id = p_team_id and match_tag = 'L';
   RETURN win;
END;
/

--function to calculate lose
CREATE OR REPLACE FUNCTION fn_lose(p_team_id IN number)
RETURN NUMBER is
lose NUMBER(5):=0;
BEGIN
SELECT Count(*) INTO lose FROM tbl_ipl_matches_ayush WHERE NOT winner_team_id = p_team_id AND (p_team_id = team_one_id OR p_team_id = team_two_id ) and match_tag = 'L';
RETURN lose;

END;
/

--function to calculate nrr
CREATE OR REPLACE FUNCTION fn_nrr(p_team_id IN number)
RETURN NUMBER IS
nrr NUMBER:= 0;
overPlayed NUMBER;
overAgainst NUMBER;
runsScored NUMBER;
runsAgainst NUMBER;
BEGIN
        overPlayed := 0;
        overAgainst := 0;
        runsScored := 0;
        runsAgainst := 0;
          FOR f IN (SELECT * FROM tbl_ipl_matches_ayush WHERE p_team_id = team_one_id OR p_team_id = team_two_id and match_tag='L' )
          LOOP
          IF (f.team_one_id = p_team_id) THEN
            IF(f.team_one_wicket = 10) THEN
              overPlayed := overPlayed + 20*6 ;
            ELSE
               overPlayed := overPlayed + floor(f.team_one_over)*6+ (Abs(f.team_one_over)-Floor(f.team_one_over))*10;
            END IF;
            IF(f.team_two_wicket=10) THEN
             overAgainst := overAgainst + 20*6;
            ELSE
             overAgainst :=overAgainst+ floor(f.team_two_over)*6+ (Abs(f.team_two_over)-Floor(f.team_two_over))*10;
            END IF;
            runsScored := runsScored + f.team_one_runs;
            runsAgainst :=runsAgainst +f.team_two_runs;
          ELSE
          IF(f.team_two_wicket= 10)THEN
            overPlayed := overPlayed + 20 *6;
          ELSE
            overPlayed :=overPlayed+ floor(f.team_two_over)*6+ (Abs(f.team_two_over)-Floor(f.team_two_over))*10;
          END IF;
          IF(f.team_one_wicket= 10)THEN
            overAgainst :=overAgainst + 20 *6;
          ELSE
          overAgainst :=overAgainst + floor(f.team_one_over)*6+ (Abs(f.team_one_over)-Floor(f.team_one_over))*10;
          END IF;
           runsScored :=runsScored + f.team_two_runs;
           runsAgainst:=runsAgainst +f.team_one_runs;
          END IF;
          END LOOP;
          nrr := Round(((runsScored/overPlayed) - (runsAgainst/overAgainst))*6,3);
          RETURN nrr;
END;
/

--view for league table
CREATE OR REPLACE VIEW view_league_table  AS
SELECT team_name,To_Char(fn_played(team_id)) AS PLD,To_Char(fn_wins(team_id)) AS W,
To_Char(fn_lose(team_id)) AS L,'0' AS T,'0' AS NR,
To_Char(fn_wins(team_id)*2) AS Pts,TO_char(fn_nrr(team_id)) AS NRR,NULL AS " ",NULL AS "  ",
NULL AS "    ",NULL AS "   ",NULL AS "     ",
NULL AS "      " ,NULL AS "       ",NULL AS "         ",NULL AS "        ",NULL AS "            ",null AS "          "
FROM tbl_ipl_ayush ORDER BY w desc;

SELECT * FROM view_league_table;

SELECT * FROM VIEW_match_results_one;
--first half of league matches
CREATE OR REPLACE VIEW view_match_results_one AS
SELECT  "c1" AS c1, "c2" AS c2,"c3" AS c3 , "c4" AS c4,"c5" AS c5,ROWNUM AS r_one FROM(
SELECT  aa ,match_id,team_name AS "c1",V AS "c2",team_two AS "c3",result AS "c4",NULL AS "c5" FROM(
SELECT ROWNUM AS aa ,match_tag,match_id,team_name,V,team_two,result," " FROM (
SELECT a.match_tag,a.match_id, b.team_name AS team_name,'v' AS V,c.team_name AS team_two, a.result AS result,null AS " "
FROM tbl_ipl_matches_ayush a
inner  JOIN tbl_ipl_ayush b ON a.team_one_id = b.team_id
inner JOIN tbl_ipl_ayush c ON a.team_two_id = c.team_id
where a.match_tag = 'L' AND (a.match_id BETWEEN 1 AND 28)
union
SELECT a.match_tag,a.match_id,NULL,NULL,NULL,NULL,NULL FROM tbl_ipl_matches_ayush a
UNION
SELECT a.match_tag,a.match_id, a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||' overs)',' ' ,
a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||' overs)' AS team_two, null,null AS " "
FROM tbl_ipl_matches_ayush a
inner  JOIN tbl_ipl_ayush b ON a.team_one_id = b.team_id
inner JOIN tbl_ipl_ayush c ON a.team_two_id = c.team_id
where a.match_tag = 'L' AND (a.match_id BETWEEN 1 AND 28))
)w
where match_tag = 'L' AND (match_id BETWEEN 1 AND 28) AND aa != 5
ORDER BY match_id ASC,team_name desc )
;

--view for the second half of matches
CREATE OR REPLACE VIEW view_match_results_two AS
SELECT  "c1" AS c1, "c2" AS c2,"c3" AS c3, "c4" AS c4,"c5" AS c5,ROWNUM AS r_three FROM(
SELECT  aa ,match_id,team_name AS "c1",V AS "c2",team_two AS "c3",result AS "c4",NULL AS "c5" FROM(
SELECT ROWNUM AS aa ,match_tag,match_id,team_name,V,team_two,result," " FROM (
SELECT a.match_tag,a.match_id, b.team_name AS team_name,'v' AS V,c.team_name AS team_two, a.result AS result,null AS " "
FROM tbl_ipl_matches_ayush a
inner  JOIN tbl_ipl_ayush b ON a.team_one_id = b.team_id
inner JOIN tbl_ipl_ayush c ON a.team_two_id = c.team_id
where a.match_tag = 'L' AND (a.match_id BETWEEN 29 AND 56)
union
SELECT a.match_tag,a.match_id,NULL,NULL,NULL,NULL,NULL FROM tbl_ipl_matches_ayush a
UNION
SELECT a.match_tag,a.match_id, a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||' overs)',' ' ,
a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||' overs)' AS team_two, null,null AS " "
FROM tbl_ipl_matches_ayush a
inner  JOIN tbl_ipl_ayush b ON a.team_one_id = b.team_id
inner JOIN tbl_ipl_ayush c ON a.team_two_id = c.team_id
where a.match_tag = 'L' AND (a.match_id BETWEEN 29 AND 56))
)w
where match_tag = 'L' AND (match_id BETWEEN 29 AND 56) AND aa != 33
ORDER BY match_id ASC,team_name desc )
;

--pivot view for match summary
CREATE OR REPLACE VIEW view_matchSummary AS
WITH x AS (
    SELECT * FROM(
    SELECT b.team_name AS Match_Summary ,c.sh_name as away,d.sh_name AS winner
    FROM tbl_ipl_matches_ayush a
    INNER JOIN tbl_ipl_ayush b ON (a.home_team_id = b.team_id)
    INNER JOIN tbl_ipl_ayush c on (a.away_team_id = c.team_id )
    INNER JOIN tbl_ipl_ayush d on (a.winner_team_id = d.team_id)
    where a.match_tag = 'L'
)
 pivot( Max(winner) FOR away IN ('CSK' AS CSK,'DD' AS DD,'KXIP' AS KXIP,'KKR' AS KKR,'MI' AS MI,'RR' AS RR,'RCB' AS RCB,'SRH' as SRH,NULL AS "n1", NULL AS "n2",
  NULL AS "n3",NULL AS "n4", NULL AS "n5",NULL AS "n6",NULL AS "n7",NULL AS "n8",NULL AS "n9",NULL AS "n10")))
 SELECT * FROM x order by decode(Match_Summary,'Chennai Super kings', 1, 'Delhi Daredevils', 2, 'Kings XI Punjab', 3, 'Kolkata Knight Riders', 4,'Mumbai Indians', 5,'Rajasthan Royals',6,'Royal Challengers Banglalore',7,8);


--function for league progression
create or replace function fn_league_progression (p_team_id in NUMBER,p_index IN number)
return number IS
result NUMBER:=0;
total number := 0;
cnt NUMBER:=0;
type scoreArr IS VARRAY(14) OF INTEGER;
scores scoreArr;

BEGIN
    scores := scoreArr(0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    FOR d IN (SELECT * FROM tbl_ipl_matches_ayush WHERE (p_team_id = team_one_id
     OR p_team_id = team_two_id) and (match_tag='L') )
     LOOP
     IF(d.winner_team_id = p_team_id) THEN
     total:=total+2;
     END IF;
     cnt:=cnt+1;

    scores(cnt):=total;
    END LOOP;
    result := scores(p_index);
    RETURN result;
END;
/

--function for leaque progression
CREATE OR REPLACE FUNCTION fn_playoffs_progression(p_team_id IN NUMBER,p_match_type IN varchar2)
RETURN VARCHAR2 IS
 v_result VARCHAR2(5);
 BEGIN
     FOR f IN (SELECT * FROM tbl_ipl_matches_ayush WHERE not(match_tag='L') AND (team_one_id = p_team_id OR team_two_id = p_team_id))
     loop
     IF((p_match_type LIKE 'Q1%' OR p_match_type LIKE '%E') AND f.match_tag in ('Q1','E')) THEN
      IF(p_team_id = f.winner_team_id) THEN
        v_result := 'W';
      ELSE v_result:='L';
      END IF;
     END IF;
     IF ((p_match_type = 'Q2')AND f.match_tag = 'Q2') THEN
      IF(p_team_id = f.winner_team_id) THEN
        v_result := 'W';
      ELSE v_result:='L';
      END IF;
     END IF;
     IF ((p_match_type= 'F')AND f.match_tag = 'F') THEN
      IF(p_team_id = f.winner_team_id) THEN
        v_result := 'W';
      ELSE v_result:='L';
      END IF;
     END IF;
    END LOOP;
    RETURN v_result;
 END;
 
 /

CREATE OR REPLACE VIEW view_league_progression AS
SELECT team_name,To_Char(fn_league_progression(team_id,1)) AS "1",To_Char(fn_league_progression(team_id,2)) AS "2",To_Char(fn_league_progression(team_id,3)) AS "3",
To_Char(fn_league_progression(team_id,4)) AS "4",To_Char(fn_league_progression(team_id,5)) AS "5",To_Char(fn_league_progression(team_id,6)) AS "6",To_Char(fn_league_progression(team_id,7) )AS "7",
To_Char(fn_league_progression(team_id,8)) AS "8",To_Char(fn_league_progression(team_id,9)) AS "9",To_Char(fn_league_progression(team_id,10)) AS "10",To_Char(fn_league_progression(team_id,11)) AS "11",
To_Char(fn_league_progression(team_id,12)) AS "12",To_Char(fn_league_progression(team_id,13)) AS "13",To_Char(fn_league_progression(team_id,14)) AS "14",
To_Char(fn_playoffs_progression(team_id,'Q1/E')) AS "Q1/E", To_Char(fn_playoffs_progression(team_id,'Q2')) AS "Q2",To_Char(fn_playoffs_progression(team_id,'F')) AS "F",
NULL AS " "
FROM tbl_ipl_ayush;

SELECT * FROM view_league_progression;
UNION
select * from view_matchSummary;


--qualifier-1
CREATE OR REPLACE VIEW view_qualifier_1 as
SELECT b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " "
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'Q1'
UNION all
SELECT c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " "
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'Q1';

--Eliminator
CREATE OR REPLACE VIEW view_eliminator AS
SELECT b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " "
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'E'
UNION all
SELECT c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " "
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'E';

--Qualifier-2
CREATE OR REPLACE VIEW view_qualifier_2 as
SELECT b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " "
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'Q2'
UNION all
SELECT c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " "
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'Q2';

--finals
CREATE OR REPLACE VIEW view_finals AS
SELECT b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " "
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'F'
UNION all
SELECT c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " "
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'F';

--combined view_table
CREATE OR REPLACE VIEW view_mid_section AS
SELECT ROWNUM AS r_two," " AS c1,"  " AS c2, "   " AS c3,"    " AS c4,"      " AS c5,"       " AS c6,"        " AS c7,"Group matches" AS c8,"              " AS c9,
"          " AS c10,"             " AS c11,
"                  " AS c12,"                   " AS c13,"         " AS c14,"                     " AS c15,"           " AS c16,"                          " AS c17,
"Playoffs" AS c18,"                         " AS c19,"            " AS c20,"                " AS c21 FROM(

SELECT NULL AS " ",NULL AS "  ",'League progression ->'AS "   ",'1' AS "    ",'2' AS "      ",'3' AS "       ",'4' AS "        ",'5' AS "Group matches",'6' AS "              ",
'7' AS "          ",'8' AS "             ",
'9' AS "                  ",'10' AS "                   ",'11' AS "         ",'12' AS "                     ",'13' AS "           ",'14' AS "                          ",
'Q1/E' AS "Playoffs",'Q2' AS "                         ",'F' AS "            ",NULL AS "                "
FROM dual
UNION all
SELECT NULL,NULL,t.* FROM view_league_progression t
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT NULL,NULL,'Match Summary','CSK','DD','KXIP','KKR','MI','RR','RCB','SRH',NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL  FROM DUAL
UNION ALL
select NULL,NULL,a.* from view_matchSummary a
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT NULL,NULL,'League table',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT NULL,NULL,'Team','Pld','W','L','T','NR','Pts','NRR',NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL FROM dual
UNION all
SELECT NULL,NULL,l.* FROM view_league_table l
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION all
SELECT 'P',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT NULL,NULL,'Qualifier-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT 'L',NULL,b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'Q1'
UNION all
SELECT NULL,NULL,c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'Q1'
UNION ALL
SELECT 'A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,null,'Q-2',NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
FROM dual
UNION ALL
SELECT 'Y',NULL,NULL,NULL,NULL,NULL,null,b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'Q2'
UNION all
SELECT null,NULL,NULL,NULL,NULL,NULL,null,c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'Q2'
UNION ALL
SELECT 'O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT 'F',NULL,'Eliminator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION all
SELECT NULL,NULL,b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'E'
UNION all
SELECT 'F',NULL,c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'E'
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT 'S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION all
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT 'F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT 'I',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT 'N',NULL, b.team_name,a.team_one_runs||'/'||a.team_one_wicket||'('||a.team_one_over||')' AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a
JOIN tbl_ipl_ayush b ON b.team_id = a.team_one_id
WHERE match_tag = 'F'
UNION all
SELECT 'A',NULL,c.team_name,a.team_two_runs||'/'||a.team_two_wicket||'('||a.team_two_over||')'AS " ",
NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM tbl_ipl_matches_ayush a JOIN tbl_ipl_ayush c ON c.team_id = a.team_two_id
WHERE match_tag = 'F'
UNION ALL
SELECT 'L',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual
UNION ALL
SELECT null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null
FROM dual);

--final result joining three views
SELECT x.c1 AS " ", x.c2 AS "     ",x.c3 AS "Match Results(League)", x.c4 AS "  ",x.c5 AS "   " ,
 z.c1 AS " ",z.c2 AS "  ",z.c3 AS "     ",z.c4 AS "    ",z.c5 AS "      ",z.c6 AS "       ",z.c7 AS "        ",z.c8 AS "Group matches",z.c9 AS "              ",
 z.c10 AS "          ",z.c11  AS "             ",
 z.c12 AS "                  ",z.c13  AS "                   ",z.c14 AS "         ",z.c15 AS "                     ",z.c16 AS "           ",z.c17 AS "                          ",
 c18 AS "Playoffs",c19 AS "                         ",c20 AS "            ",c21 AS "                "
  ,y.c1 AS " ", y.c2 AS "     ",y.c3 AS "Match Results(League)", y.c4 AS "  ",y.c5 AS "   "
FROM view_match_results_one x
INNER JOIN view_mid_section z ON x.r_one = z.r_two
INNER JOIN view_match_results_two y ON x.r_one = y.r_three;



}
 