--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Debian 15.5-1.pgdg120+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: insert_data_and_return_key(); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.insert_data_and_return_key() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
    KEY1 INTEGER;
    KEY2 INTEGER;
    KEY3 INTEGER;
    KEY4 INTEGER;
BEGIN
    Insert into xml_panel ("cmodel","lotno","stationid","fdate","cycletime","operator","confirmtime","status","machine","carrier","lane","stdimage",filename) values ('4DC1M-D31-4F-3-03-B','YCA1-24041005','TRI-MainPC-A','2024/04/08 17:46:55','10.5','2098','2024/04/08 17:55:35','False Call','AOI','NOREAD','1','\\\\TRI-REPAIRPC-A\\AOI_REPAIR_DATA\\Model\\4DC1M-D31-4F-3-03-B_5NS8GT1C1XTS3-K-6DC2\\GOLDENIMAGE\\','/home/innodisk/workspace/Judy/NVIDIA_TAO/share/XML/20240408/TRI-MainPC-A/4DC1M-D31-4F-3-03-B/YCA12404010050000033/20240408174655_YCA12404010050000033.xml') returning pk_panelid into KEY1;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'1','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fK_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_1','T','5NS8GT1C1XTS3','IC','False Call','3D 高度',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_1_SolderLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'2','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_2','T','5NS8GT1C1XTS3','IC','False Call','3D 高度',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_2_SolderLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'ST1_2','T','7TJK-02S050-AB3','IC','False Call','3D 高度',NULL,NULL,NULL,'7TJK-02S050-AB3','50') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\ST1_2_SolderLight.jpg','99','99','3718','982','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'3','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'U1_3','T','6D7A03Q100C2','IC','False Call','短路',NULL,NULL,NULL,'6D7A03Q100C2','100') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\U1_3_SolderLight.jpg','99','99','1907','1900','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_3','T','5NS8GT1C1XTS3','IC','False Call','3D 高度',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_3_SolderLight.jpg','99','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'ST1_3','T','7TJK-02S050-AB3','IC','False Call','GENERAL SOLDER',NULL,NULL,NULL,'7TJK-02S050-AB3','50') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\ST1_3_SolderLight.jpg','99','99','3717','982','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'4','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_4','T','5NS8GT1C1XTS3','IC','False Call','PRESENCE',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_4_SolderLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_4_LowAngleLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'ST1_4','T','7TJK-02S050-AB3','IC','False Call','短路',NULL,NULL,NULL,'7TJK-02S050-AB3','50') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\ST1_4_SolderLight.jpg','99','99','3717','982','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'5','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'U1_5','T','6D7A03Q100C2','IC','False Call','短路',NULL,NULL,NULL,'6D7A03Q100C2','100') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\U1_5_SolderLight.jpg','99','99','1908','1900','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_5','T','5NS8GT1C1XTS3','IC','False Call','3D 高度',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_5_SolderLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'ST1_5','T','7TJK-02S050-AB3','IC','False Call','GENERAL SOLDER',NULL,NULL,NULL,'7TJK-02S050-AB3','50') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\ST1_5_SolderLight.jpg','99','99','3718','982','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'6','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fK_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'U1_6','T','6D7A03Q100C2','IC','False Call','3D 高度',NULL,NULL,NULL,'6D7A03Q100C2','100') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\U1_6_SolderLight.jpg','99','99','1908','1899','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'7','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fK_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_7','T','5NS8GT1C1XTS3','IC','False Call','3D 高度',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_7_SolderLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'8','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'U1_8','T','6D7A03Q100C2','IC','False Call','短路',NULL,NULL,NULL,'6D7A03Q100C2','100') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\U1_8_SolderLight.jpg','99','99','1908','1899','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'RP6_8','T','9R24033R-501','RNET','False Call','SOLDER 爬錫',NULL,NULL,NULL,'9R24033R-501','4') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\RP6_8_SolderLight.jpg','317','148','523','531','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'9','T','YCA12404010050000033','False Call','26','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'U1_9','T','6D7A03Q100C2','IC','False Call','短路',NULL,NULL,NULL,'6D7A03Q100C2','100') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\U1_9_SolderLight.jpg','99','99','1908','1900','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'F1_9','T','5NS8GT1C1XTS3','IC','False Call','3D 高度',NULL,NULL,NULL,'5NS8GT1C1XTS3','48') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240408\TRI-MainPC-A\4DC1M-D31-4F-3-03-B\YCA12404010050000033\F1_9_SolderLight.jpg','100','99','1738','2308','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'10','T','YCA12404010050000033','SKIP','0','0') returning pk_boardid into KEY2;
    RETURN KEY1;
END $$;


ALTER FUNCTION public.insert_data_and_return_key() OWNER TO admin;

--
-- Name: insert_file_data(); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.insert_file_data() RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
    DECLARE 
    KEY1 INTEGER;
    KEY2 INTEGER;
    KEY3 INTEGER;
    KEY4 INTEGER;
    BEGIN
    Insert into xml_panel ("cmodel","lotno","stationid","fdate","cycletime","operator","confirmtime","status","machine","carrier","lane","stdimage",filename) values ('4M4SI8B8N1A10-B','NCA1-240418039','TRI-MainPC-D','2024/04/22 18:50:14','8.9','YL00312','2024/04/22 18:57:06','False Call','AOI','NOREAD','1','\\\\TRI-REPAIRPC-D\\AOI_REPAIR_DATA\\Model\\4M4SI8B8N1A10-B_5D48GSF8CRLC0\\GOLDENIMAGE\\','/home/innodisk/workspace/Judy/NVIDIA_TAO/share/XML/20240422/TRI-MainPC-D/4M4SI8B8N1A10-B/NCA12404180390000713/20240422185014_NCA12404180390000713.xml') returning pk_panelid into KEY1;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'1','T','NCA12404180390000713','PASS','122','0') returning pk_boardid into KEY2;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'2','T','NCA12404180390000713','PASS','122','0') returning pk_boardid into KEY2;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'3','T','NCA12404180390000713','False Call','122','0') returning pk_boardid into KEY2;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'R52_3','T','9R42240R1010','R','False Call','本體',NULL,'None',NULL,'9R42240R1010','0') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240422\TRI-MainPC-D\4M4SI8B8N1A10-B\NCA12404180390000713\R52_3_SolderLight.jpg','259','141','381','339','0','0') returning pk_imgid into KEY4;Insert into xml_component (fk_boardid,fk_panelid,compname,tb,type,packagetype,status,machinedefect,confirmdefect,ai_result,ai_version,partno,pincount) values (KEY2,KEY1,'1_3','T','GOLD-72.58',' ','False Call','沾錫',NULL,'None',NULL,'GOLD-72.58','193') returning pk_compid into KEY3;Insert into xml_image (fk_compid,fk_boardid,fk_panelid,picpath,x1,y1,x2,y2,camera,angle) values (KEY3,KEY2,KEY1,'\\Yl1-smtaoi-nas\aoi_ai\MAP\20240422\TRI-MainPC-D\4M4SI8B8N1A10-B\NCA12404180390000713\1_3_WhiteLight.jpg','207','99','633','6851','0','0') returning pk_imgid into KEY4;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'4','T','NCA12404180390000713','PASS','122','0') returning pk_boardid into KEY2;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'5','T','NCA12404180390000713','PASS','122','0') returning pk_boardid into KEY2;Insert into xml_board (fk_panelid,imulti,topbtm,boardsn,status,totalcomp,failcomp) values (KEY1,'6','T','NCA12404180390000713','PASS','122','0') returning pk_boardid into KEY2;
    RETURN KEY1;
    END $$;


ALTER FUNCTION public.insert_file_data() OWNER TO admin;

--
-- Name: p_ai_result_type(integer, character varying, character varying, integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_ai_result_type(mytype integer, myfrom character varying, myto character varying, mypage integer, mystation character varying, mymodel character varying) RETURNS TABLE(my_order bigint, compname character varying, partno character varying, machinedefect character varying, cropimage text, ai_threshold numeric, ai_confidence numeric)
    LANGUAGE plpgsql
    AS $$
begin

	if mytype=0 THEN

		return query
		select *
		from p_ai_result_type_a(myfrom,myto,mypage,mystation,mymodel);
		
	ELSE

		return query
		select *
		from p_ai_result_type_b(myfrom,myto,mystation,mymodel);

	end if;

     
end;
$$;


ALTER FUNCTION public.p_ai_result_type(mytype integer, myfrom character varying, myto character varying, mypage integer, mystation character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_ai_result_type_a(character varying, character varying, integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_ai_result_type_a(myfrom character varying, myto character varying, mypage integer, mystation character varying, mymodel character varying) RETURNS TABLE(myorder bigint, compname character varying, partno character varying, machinedefect character varying, cropimage text, ai_threshold numeric, ai_confidence numeric)
    LANGUAGE plpgsql
    AS $_$
DECLARE
pagefrom integer;
str1 text;
BEGIN
pagefrom := (myPage - 1) * 8;

-- Create temporary table if not exists
CREATE TEMP TABLE IF NOT EXISTS temp1 (
compname varchar,
partno varchar,
machinedefect varchar,
pk_imgid INT,
ai_threshold numeric,
ai_confidence numeric
) ON COMMIT DELETE ROWS;

-- Truncate table temp
TRUNCATE temp1;

-- Insert into temp table based on condition
IF myStation = 'All' THEN
	str1 := '
	INSERT INTO temp1 
	SELECT C.compName, C.partno, C.machinedefect, D.pk_imgid, D.ai_threshold, D.ai_confidence
	FROM xml_image D 
	LEFT JOIN xml_panel A ON D.fk_panelID = A.pk_panelid
	LEFT JOIN xml_component C ON D.fk_compid = C.pk_compid
	LEFT JOIN xml_picture E ON D.pk_imgid = E.fk_imgid
	WHERE A.fdate >= $1::timestamp AND A.fdate <= $2::timestamp AND C.ai_result = ''NG'' AND C.status = ''False Call''
	and A.cmodle=$4
	ORDER BY D.pk_imgid LIMIT 8 OFFSET $3
	';
	EXECUTE str1 USING myFrom, myTo, pagefrom,mymodel;
ELSE
	str1 := '
	INSERT INTO temp1 
	SELECT C.compName, C.partno, C.machinedefect, D.pk_imgid, D.ai_threshold, D.ai_confidence
	FROM xml_image D 
	LEFT JOIN xml_panel A ON D.fk_panelID = A.pk_panelid
	LEFT JOIN xml_component C ON D.fk_compid = C.pk_compid
	LEFT JOIN xml_picture E ON D.pk_imgid = E.fk_imgid
	WHERE A.fdate >= $1::timestamp AND A.fdate <= $2::timestamp AND C.ai_result = ''NG'' AND C.status = ''False Call'' AND A.stationid = $3
	and A.cmodel=$5
	ORDER BY D.pk_imgid LIMIT 8 OFFSET $4
	';
	EXECUTE str1 USING myFrom, myTo, myStation, pagefrom,mymodel;
END IF;

-- Select and rank results
RETURN QUERY
	SELECT rank() OVER (ORDER BY A.pk_imgid) AS my_order,
	A.compname,
	A.partno,
	A.machinedefect,
	B.cropimage,
	ROUND(A.ai_threshold,2) as ai_threshold,
	ROUND(A.ai_confidence,2) as ai_confidence
	FROM temp1 A
	LEFT JOIN (
	SELECT fk_imgid,
	'data:image/jpeg;base64,' || encode(E.cropimage, 'base64') AS CropImage
	FROM xml_picture E
	WHERE fk_imgid IN (SELECT pk_imgid FROM temp1)
	) B ON A.pk_imgid = B.fk_imgid
	ORDER BY A.pk_imgid;
END;
$_$;


ALTER FUNCTION public.p_ai_result_type_a(myfrom character varying, myto character varying, mypage integer, mystation character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_ai_result_type_b(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_ai_result_type_b(myfrom character varying, myto character varying, mystation character varying, mymodel character varying) RETURNS TABLE(myorder bigint, compname character varying, partno character varying, machinedefect character varying, cropimage text, ai_threshold numeric, ai_confidence numeric)
    LANGUAGE plpgsql
    AS $_$
DECLARE
str1 text;
BEGIN

-- Create temporary table if not exists
CREATE TEMP TABLE IF NOT EXISTS temp1 (
compname varchar,
partno varchar,
machinedefect varchar,
pk_imgid INT,
ai_threshold numeric,
ai_confidence numeric
) ON COMMIT DELETE ROWS;

-- Truncate table temp
TRUNCATE temp1;

-- Insert into temp table based on condition
IF myStation = 'All' THEN
	str1 := '
	INSERT INTO temp1 
	SELECT C.compName, C.partno, C.machinedefect, D.pk_imgid, D.ai_threshold, D.ai_confidence
	FROM xml_image D 
	LEFT JOIN xml_panel A ON D.fk_panelID = A.pk_panelid
	LEFT JOIN xml_component C ON D.fk_compid = C.pk_compid
	LEFT JOIN xml_picture E ON D.pk_imgid = E.fk_imgid
	WHERE A.fdate >= $1::timestamp AND A.fdate <= $2::timestamp AND C.ai_result = ''OK'' AND C.status = ''REPAIR''
	and A.cmodel=$3
	ORDER BY D.pk_imgid
	';
	EXECUTE str1 USING myFrom, myTo,mymodel;
ELSE
	str1 := '
	INSERT INTO temp1 
	SELECT C.compName, C.partno, C.machinedefect, D.pk_imgid, D.ai_threshold, D.ai_confidence
	FROM xml_image D 
	LEFT JOIN xml_panel A ON D.fk_panelID = A.pk_panelid
	LEFT JOIN xml_component C ON D.fk_compid = C.pk_compid
	LEFT JOIN xml_picture E ON D.pk_imgid = E.fk_imgid
	WHERE A.fdate >= $1::timestamp AND A.fdate <= $2::timestamp AND C.ai_result = ''OK'' AND C.status = ''REPAIR'' AND A.stationid = $3
	and A.cmodel=$4
	ORDER BY D.pk_imgid
	';
	EXECUTE str1 USING myFrom, myTo, myStation, mymodel;
END IF;

-- Select and rank results
RETURN QUERY
	SELECT rank() OVER (ORDER BY A.pk_imgid) AS my_order,
	A.compname,
	A.partno,
	A.machinedefect,
	B.cropimage,
	ROUND(A.ai_threshold,2) as ai_threshold,
	ROUND(A.ai_confidence,2) as ai_confidence
	FROM temp1 A
	LEFT JOIN (
	SELECT fk_imgid,
	'data:image/jpeg;base64,' || encode(E.cropimage, 'base64') AS CropImage
	FROM xml_picture E
	WHERE fk_imgid IN (SELECT pk_imgid FROM temp1)
	) B ON A.pk_imgid = B.fk_imgid
	ORDER BY A.pk_imgid;
END;
$_$;


ALTER FUNCTION public.p_ai_result_type_b(myfrom character varying, myto character varying, mystation character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_chart1(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart1(mystation character varying, myfrom character varying, myto character varying) RETURNS TABLE(status character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT REPLACE(COALESCE(C.ai_result,'Not_Process'),'null','None')::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') group by C.ai_result;
        
    else
        return query 
        SELECT REPLACE(COALESCE(C.ai_result,'Not_Process'),'null','None')::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and A.stationid=mystation group by C.ai_result;
    
    end if;

       
end;
$$;


ALTER FUNCTION public.p_chart1(mystation character varying, myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_chart1(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart1(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) RETURNS TABLE(status character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT REPLACE(COALESCE(C.ai_result,'Not_Process'),'null','None')::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
			and cmodel=mymodel
			group by C.ai_result;
        
    else
        return query 
        SELECT REPLACE(COALESCE(C.ai_result,'Not_Process'),'null','None')::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and A.stationid=mystation 
		and A.cmodel=mymodel group by C.ai_result;
    
    end if;

       
end;
$$;


ALTER FUNCTION public.p_chart1(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_chart2(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart2(mystation character varying, myfrom character varying, myto character varying) RETURNS TABLE(status character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and ai_result='NG' group by status;
        
    else
        return query 
        SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and ai_result='NG' and A.stationid=mystation group by C.status;
    
    end if;

       
end;$$;


ALTER FUNCTION public.p_chart2(mystation character varying, myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_chart2(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart2(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) RETURNS TABLE(status character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
			and A.cmodel=mymodel and ai_result='NG' group by status;
        
    else
        return query 
        SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
		and A.cmodel=mymodel and ai_result='NG' and A.stationid=mystation group by C.status;
    
    end if;

       
end;
$$;


ALTER FUNCTION public.p_chart2(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_chart3(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart3(mystation character varying, myfrom character varying, myto character varying) RETURNS TABLE(status character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and ai_result='OK' group by status;
        
    else
        return query 
        SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and ai_result='OK' and A.stationid=mystation group by C.status;
    
    end if;

       
end;$$;


ALTER FUNCTION public.p_chart3(mystation character varying, myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_chart3(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart3(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) RETURNS TABLE(status character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
			and cmodel=mymodel and ai_result='OK' group by status;
        
    else
        return query 
        SELECT C.status::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
		and cmodel=mymodel and ai_result='OK' and A.stationid=mystation group by C.status;
    
    end if;

       
end;
$$;


ALTER FUNCTION public.p_chart3(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_chart4(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart4(mystation character varying, myfrom character varying, myto character varying) RETURNS TABLE(machinedefect character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT C.machinedefect::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and C.ai_result='null' group by C.machinedefect;
        
    else
        return query 
        SELECT C.machinedefect::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and C.ai_result='null' and A.stationid=mystation group by C.machinedefect;
    
    end if;

       
end;
$$;


ALTER FUNCTION public.p_chart4(mystation character varying, myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_chart4(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_chart4(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) RETURNS TABLE(machinedefect character varying, num integer)
    LANGUAGE plpgsql
    AS $$
begin
	
		
    if mystation='All' then
            return query 
            SELECT C.machinedefect::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
            where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
			and cmodel=mymodel and C.ai_result='null' group by C.machinedefect;
        
    else
        return query 
        SELECT C.machinedefect::varchar,count(*)::integer as num FROM xml_component C left join xml_panel A on C.fk_panelid= A.pk_panelid  
        where fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') 
		and cmodel=mymodel and C.ai_result='null' and A.stationid=mystation group by C.machinedefect;
    
    end if;

       
end;
$$;


ALTER FUNCTION public.p_chart4(mystation character varying, myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_date(character varying); Type: PROCEDURE; Schema: public; Owner: admin
--

CREATE PROCEDURE public.p_date(IN themonth character varying)
    LANGUAGE plpgsql
    AS $$
begin

    SELECT TO_CHAR(fdate::date, 'yyyy-mm-dd') as TheDate 
    FROM xml_panel where TO_CHAR(fdate::date, 'yyyy-mm')=themonth
    group by  TO_CHAR(fdate::date, 'yyyy-mm-dd');

end;$$;


ALTER PROCEDURE public.p_date(IN themonth character varying) OWNER TO admin;

--
-- Name: p_metric1(character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric1(myfrom character varying, myto character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
DECLARE myfalsecall numeric=0;
begin
	
		
SELECT count(*) into mytotal FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS');

SELECT count(*) into myfalsecall FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and B.status='False Call';

return 
case when mytotal=0 then 0
else
ROUND((mytotal-myfalsecall)/mytotal*100,2)
end if;

       
end;
$$;


ALTER FUNCTION public.p_metric1(myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_metric1(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric1(myfrom character varying, myto character varying, mymodel character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
DECLARE myfalsecall numeric=0;
begin
	
		
SELECT count(*) into mytotal FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and A.cmodel=mymodel;

SELECT count(*) into myfalsecall FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and B.status='False Call'
and A.cmodel=mymodel;

return 
case when mytotal=0 then 0
else
ROUND((mytotal-myfalsecall)/mytotal*100,2)
end if;

       
end;
$$;


ALTER FUNCTION public.p_metric1(myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_metric2(character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric2(myfrom character varying, myto character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
DECLARE myfalsecall numeric=0;
DECLARE myok numeric=0;
begin
	
		
SELECT count(*) into mytotal FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS');

SELECT count(*) into myfalsecall FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and B.status='False Call';

select count(*) into myok from
(
select T1.*,coalesce(null,T2.count_ok,0) as count_ok from 
(SELECT 
C.fk_boardid,count(*) as count_all
FROM xml_component C 
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
group by C.fk_boardid) T1 
left join 
(SELECT 
C.fk_boardid,count(*) as count_ok
FROM xml_component C 
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and C.ai_result='OK'
group by C.fk_boardid) T2
on T1.fk_boardid=T2.fk_boardid
order by count_ok desc
) T3
where count_all=count_ok;

return 
case when mytotal=0 then 0
else
ROUND(((mytotal-myfalsecall)+myok)/mytotal*100,2)
end if;
       
end;
$$;


ALTER FUNCTION public.p_metric2(myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_metric2(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric2(myfrom character varying, myto character varying, mymodel character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
DECLARE myfalsecall numeric=0;
DECLARE myok numeric=0;
begin
	
		
SELECT count(*) into mytotal FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and A.cmodel=mymodel;

SELECT count(*) into myfalsecall FROM xml_board B left join xml_panel A 
on B.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and B.status='False Call'
and A.cmodel=mymodel;

select count(*) into myok from
(
select T1.*,coalesce(null,T2.count_ok,0) as count_ok from 
(SELECT 
C.fk_boardid,count(*) as count_all
FROM xml_component C 
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and A.cmodel=mymodel
group by C.fk_boardid) T1 
left join 
(SELECT 
C.fk_boardid,count(*) as count_ok
FROM xml_component C 
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS') and A.cmodel=mymodel
and C.ai_result='OK'
group by C.fk_boardid) T2
on T1.fk_boardid=T2.fk_boardid
order by count_ok desc
) T3
where count_all=count_ok;

return 
case when mytotal=0 then 0
else
ROUND(((mytotal-myfalsecall)+myok)/mytotal*100,2)
end if;
       
end;
$$;


ALTER FUNCTION public.p_metric2(myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_metric3(character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric3(myfrom character varying, myto character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
begin

select count(*) into mytotal from xml_component C
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and C.ai_result='NG' and C.status='False Call';
		


return mytotal;

       
end;
$$;


ALTER FUNCTION public.p_metric3(myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_metric3(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric3(myfrom character varying, myto character varying, mymodel character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
begin

select count(*) into mytotal from xml_component C
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and A.cmodel=mymodel and C.ai_result='NG' and C.status='False Call';
		

return mytotal;

       
end;
$$;


ALTER FUNCTION public.p_metric3(myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_metric4(character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric4(myfrom character varying, myto character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
begin

select count(*) into mytotal from xml_component C
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and A.cmodel=mymodel
and C.ai_result='OK' and C.status<>'False Call';
		

return mytotal;

       
end;
$$;


ALTER FUNCTION public.p_metric4(myfrom character varying, myto character varying) OWNER TO admin;

--
-- Name: p_metric4(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_metric4(myfrom character varying, myto character varying, mymodel character varying) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
begin

select count(*) into mytotal from xml_component C
left join xml_panel A on C.fk_panelid=A.pk_panelid
where A.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and A.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
and A.cmodel=mymodel
and C.ai_result='OK' and C.status<>'False Call';
		

return mytotal;

       
end;
$$;


ALTER FUNCTION public.p_metric4(myfrom character varying, myto character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_page(integer, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_page(mytype integer, myfrom character varying, myto character varying, mystation character varying) RETURNS TABLE(rank integer)
    LANGUAGE plpgsql
    AS $$
DECLARE mypage int=0;
begin
  
        if mytype=0 THEN
            if myStation='All' then
                SELECT Count(*) as rank
                into mypage
                FROM xml_image D 
                left join xml_panel A on D.fk_panelid= A.pk_panelid 
                left join xml_component C on D.fk_compid=C.pk_compid
                left join xml_picture E on D.pk_imgid=E.fk_imgid 
                where A.fdate>=myFrom::timestamp without time zone and A.fdate<=myTo::timestamp without time zone
                and C.ai_result='NG' and C.status='False Call';

                return query
                SELECT generate_series as rank FROM generate_series(1,(CEIL(mypage::float/8::float))::integer);

            ELSE

              
                SELECT count(*) as rank
                into mypage
                FROM xml_image D 
                left join xml_panel A on D.fk_panelid= A.pk_panelid 
                left join xml_component C on D.fk_compid=C.pk_compid
                left join xml_picture E on D.pk_imgid=E.fk_imgid 
                where A.fdate>=myFrom::timestamp without time zone and A.fdate<=myTo::timestamp without time zone
                and C.ai_result='NG' and C.status='False Call' and A.stationid=myStation;

                return query
                SELECT generate_series as rank FROM generate_series(1,(CEIL(mypage::float/8::float))::integer);

            end if;

        ELSE
            return query
            select 0 as rank;
        end if;

     
end;
$$;


ALTER FUNCTION public.p_page(mytype integer, myfrom character varying, myto character varying, mystation character varying) OWNER TO admin;

--
-- Name: p_page(integer, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_page(mytype integer, myfrom character varying, myto character varying, mystation character varying, mymodel character varying) RETURNS TABLE(rank integer)
    LANGUAGE plpgsql
    AS $$
DECLARE mypage int=0;
begin
  
        if mytype=0 THEN
            if myStation='All' then
                SELECT Count(*) as rank
                into mypage
                FROM xml_image D 
                left join xml_panel A on D.fk_panelid= A.pk_panelid 
                left join xml_component C on D.fk_compid=C.pk_compid
                left join xml_picture E on D.pk_imgid=E.fk_imgid 
                where A.fdate>=myFrom::timestamp without time zone and A.fdate<=myTo::timestamp without time zone
				 and A.cmodel=mymodel
                and C.ai_result='NG' and C.status='False Call';

                return query
                SELECT generate_series as rank FROM generate_series(1,(CEIL(mypage::float/8::float))::integer);

            ELSE

              
                SELECT count(*) as rank
                into mypage
                FROM xml_image D 
                left join xml_panel A on D.fk_panelid= A.pk_panelid 
                left join xml_component C on D.fk_compid=C.pk_compid
                left join xml_picture E on D.pk_imgid=E.fk_imgid 
                where A.fdate>=myFrom::timestamp without time zone and A.fdate<=myTo::timestamp without time zone
				 and A.cmodel=mymodel
                and C.ai_result='NG' and C.status='False Call' and A.stationid=myStation;

                return query
                SELECT generate_series as rank FROM generate_series(1,(CEIL(mypage::float/8::float))::integer);

            end if;

        ELSE
            return query
            select 0 as rank;
        end if;

     
end;
$$;


ALTER FUNCTION public.p_page(mytype integer, myfrom character varying, myto character varying, mystation character varying, mymodel character varying) OWNER TO admin;

--
-- Name: p_seq(integer); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_seq(n integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
  --here, get the first variable from function
    declare i integer= 1;

    begin
   --return the number
       return n;
    end;
  $$;


ALTER FUNCTION public.p_seq(n integer) OWNER TO admin;

--
-- Name: p_sequence(integer); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_sequence(n integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
  --here, get the first variable from function
    declare i integer= 1;

    begin
   --return the number
       return n;
    end;
  $$;


ALTER FUNCTION public.p_sequence(n integer) OWNER TO admin;

--
-- Name: p_utable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: admin
--

CREATE FUNCTION public.p_utable(myfrom character varying, myto character varying) RETURNS TABLE(fdate timestamp without time zone, ai_result character varying, ai_threshold numeric, ai_confidence numeric, ai_errorcode integer, stationid character varying, cmodel character varying, pk_panelid integer, filename character varying, compname character varying, pk_compid integer, partno character varying, x1 integer, y1 integer, x2 integer, y2 integer, picpatch character varying, pk_imgid integer, cropimge bytea, code integer)
    LANGUAGE plpgsql
    AS $$
DECLARE mytotal numeric=0;
begin

return query
SELECT a.fdate,
    c.ai_result,
    c.ai_threshold,
    c.ai_confidence,
    c.ai_errorcode,
    a.stationid,
    a.cmodel,
    a.pk_panelid,
    a.filename,
    c.compname,
    c.pk_compid,
    c.partno,
    d.x1,
    d.y1,
    d.x2,
    d.y2,
    d.picpath,
    d.pk_imgid,
    e.cropimage,
    e.code
   FROM xml_image d
     LEFT JOIN xml_panel a ON d.fk_panelid = a.pk_panelid
     LEFT JOIN xml_component c ON d.fk_compid = c.pk_compid
     LEFT JOIN xml_picture e ON d.pk_imgid = e.fk_imgid
	 where a.fdate>=TO_TIMESTAMP(myfrom,'YYYY-MM-DD HH24:MI:SS') and a.fdate<=TO_TIMESTAMP(myto,'YYYY-MM-DD HH24:MI:SS')
	 ;
		


       
end;
$$;


ALTER FUNCTION public.p_utable(myfrom character varying, myto character varying) OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dataset; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dataset (
    project_uuid uuid NOT NULL,
    dataset_uuid uuid NOT NULL,
    dataset_name text NOT NULL,
    dataset_path text,
    annotation text,
    create_time bigint NOT NULL
);


ALTER TABLE public.dataset OWNER TO admin;

--
-- Name: export; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.export (
    dataset_uuid uuid NOT NULL,
    export_uuid uuid NOT NULL,
    export_name text NOT NULL,
    export_path text,
    export_file_name text,
    export_file_type text,
    annotation text,
    create_time bigint NOT NULL
);


ALTER TABLE public.export OWNER TO admin;

--
-- Name: first_normalize_form; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.first_normalize_form (
    dataset_uuid uuid NOT NULL,
    source_uuid uuid NOT NULL,
    image_uuid uuid NOT NULL,
    board_imulti integer NOT NULL,
    light_source text NOT NULL,
    compname text NOT NULL,
    part_no text NOT NULL,
    status text NOT NULL,
    machine_defect text NOT NULL,
    ai_result text,
    crop_location json NOT NULL,
    image_path text NOT NULL,
    image_file_name text NOT NULL,
    image_file_type text NOT NULL,
    create_time bigint NOT NULL
);


ALTER TABLE public.first_normalize_form OWNER TO admin;

--
-- Name: mypage; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.mypage (
    rank bigint
);


ALTER TABLE public.mypage OWNER TO admin;

--
-- Name: project; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.project (
    project_uuid uuid NOT NULL,
    project_name text NOT NULL,
    project_status json,
    project_path text,
    annotation text,
    cover_image_name text,
    cover_image_type text,
    create_time bigint NOT NULL
);


ALTER TABLE public.project OWNER TO admin;

--
-- Name: ref_aicode; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ref_aicode (
    pk_codeid integer,
    codename character varying
);


ALTER TABLE public.ref_aicode OWNER TO admin;

--
-- Name: ref_imagecode; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ref_imagecode (
    pk_codeid integer NOT NULL,
    codename character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.ref_imagecode OWNER TO admin;

--
-- Name: ref_lightsource; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ref_lightsource (
    pk_sourceid integer NOT NULL,
    sourcename character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.ref_lightsource OWNER TO admin;

--
-- Name: ref_resultcode; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ref_resultcode (
    pk_resultid integer NOT NULL,
    codename character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.ref_resultcode OWNER TO admin;

--
-- Name: ref_tabletype; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ref_tabletype (
    pk_typeid integer NOT NULL,
    typename character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.ref_tabletype OWNER TO admin;

--
-- Name: second_normalize_form; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.second_normalize_form (
    export_uuid uuid NOT NULL,
    image_uuid uuid NOT NULL,
    training_type text,
    data_type text,
    data_status text
);


ALTER TABLE public.second_normalize_form OWNER TO admin;

--
-- Name: source; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.source (
    project_uuid uuid NOT NULL,
    source_uuid uuid NOT NULL,
    date_time bigint NOT NULL,
    station_id text NOT NULL,
    panel text NOT NULL,
    board_sn text NOT NULL,
    machine_vendor text NOT NULL,
    source_path text NOT NULL,
    source_file_name text NOT NULL,
    source_file_type text NOT NULL,
    create_time bigint NOT NULL
);


ALTER TABLE public.source OWNER TO admin;

--
-- Name: xml_picture; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.xml_picture (
    fk_imgid integer NOT NULL,
    cropimage bytea,
    code integer
);


ALTER TABLE public.xml_picture OWNER TO admin;

--
-- Name: v_imagestatus; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_imagestatus AS
 SELECT a.code,
    a.count,
    b.codename
   FROM (( SELECT xml_picture.code,
            count(*) AS count
           FROM public.xml_picture
          GROUP BY xml_picture.code) a
     LEFT JOIN public.ref_imagecode b ON ((a.code = b.pk_codeid)));


ALTER VIEW public.v_imagestatus OWNER TO admin;

--
-- Name: xml_panel; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.xml_panel (
    pk_panelid integer NOT NULL,
    cmodel character varying,
    lotno character varying,
    stationid character varying,
    fdate timestamp without time zone,
    cycletime double precision,
    operator character varying(50),
    confirmtime timestamp without time zone,
    status character varying(50),
    machine character varying(50),
    carrier character varying(50),
    lane integer,
    stdimage character varying(500),
    filename character varying(1000),
    insertdatetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.xml_panel OWNER TO admin;

--
-- Name: v_month; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_month AS
 SELECT to_char(((xml_panel.fdate)::date)::timestamp with time zone, 'yyyy-mm'::text) AS themonth
   FROM public.xml_panel
  GROUP BY (to_char(((xml_panel.fdate)::date)::timestamp with time zone, 'yyyy-mm'::text))
  ORDER BY (to_char(((xml_panel.fdate)::date)::timestamp with time zone, 'yyyy-mm'::text));


ALTER VIEW public.v_month OWNER TO admin;

--
-- Name: v_tablesize; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_tablesize AS
 SELECT t.schema_name,
    t.relname,
    pg_size_pretty(t.table_size) AS size,
    t.table_size
   FROM ( SELECT pg_namespace.nspname AS schema_name,
            pg_class.relname,
            pg_relation_size((pg_class.oid)::regclass) AS table_size
           FROM (pg_class
             JOIN pg_namespace ON ((pg_class.relnamespace = pg_namespace.oid)))) t
  WHERE ((t.schema_name !~~ 'pg_%'::text) AND (t.relname ~~ 'xml_%'::text))
  ORDER BY t.table_size DESC;


ALTER VIEW public.v_tablesize OWNER TO admin;

--
-- Name: xml_component; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.xml_component (
    pk_compid integer NOT NULL,
    fk_boardid integer,
    fk_panelid integer,
    compname character varying(50),
    tb character varying(5),
    type character varying(50),
    packagetype character varying(50),
    status character varying(50),
    machinedefect character varying(50),
    confirmdefect character varying(50),
    ai_result character varying(50),
    ai_version character varying(50),
    partno character varying(50),
    pincount integer,
    insertdatetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ai_errorcode integer,
    ai_additional jsonb,
    ai_threshold numeric,
    ai_confidence numeric
);


ALTER TABLE public.xml_component OWNER TO admin;

--
-- Name: xml_image; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.xml_image (
    pk_imgid integer NOT NULL,
    fk_compid integer,
    fk_boardid integer,
    fk_panelid integer,
    picpath character varying(1000) DEFAULT NULL::character varying,
    x1 integer,
    y1 integer,
    x2 integer,
    y2 integer,
    camera integer,
    angle integer,
    insertdatetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fk_sourceid integer,
    ai_threshold numeric,
    ai_confidence numeric,
    ai_errorcode integer,
    ai_result character varying
);


ALTER TABLE public.xml_image OWNER TO admin;

--
-- Name: v_uniontable; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_uniontable AS
 SELECT a.fdate,
    c.ai_result,
    c.ai_threshold,
    c.ai_confidence,
    c.ai_errorcode,
    a.stationid,
    a.cmodel,
    a.pk_panelid,
    a.filename,
    c.compname,
    c.pk_compid,
    c.partno,
    d.x1,
    d.y1,
    d.x2,
    d.y2,
    d.picpath,
    d.pk_imgid,
    e.cropimage,
    e.code
   FROM (((public.xml_image d
     LEFT JOIN public.xml_panel a ON ((d.fk_panelid = a.pk_panelid)))
     LEFT JOIN public.xml_component c ON ((d.fk_compid = c.pk_compid)))
     LEFT JOIN public.xml_picture e ON ((d.pk_imgid = e.fk_imgid)));


ALTER VIEW public.v_uniontable OWNER TO admin;

--
-- Name: xml_board; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.xml_board (
    pk_boardid integer NOT NULL,
    fk_panelid integer,
    imulti integer,
    topbtm character varying(5) DEFAULT NULL::character varying,
    boardsn character varying(50) DEFAULT NULL::character varying,
    status character varying(50) DEFAULT NULL::character varying,
    totalcomp integer,
    failcomp integer,
    insertdatetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.xml_board OWNER TO admin;

--
-- Name: xml_board_pk_boardid_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.xml_board_pk_boardid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xml_board_pk_boardid_seq OWNER TO admin;

--
-- Name: xml_board_pk_boardid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.xml_board_pk_boardid_seq OWNED BY public.xml_board.pk_boardid;


--
-- Name: xml_component_pk_compid_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.xml_component_pk_compid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xml_component_pk_compid_seq OWNER TO admin;

--
-- Name: xml_component_pk_compid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.xml_component_pk_compid_seq OWNED BY public.xml_component.pk_compid;


--
-- Name: xml_image_pk_imgid_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.xml_image_pk_imgid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xml_image_pk_imgid_seq OWNER TO admin;

--
-- Name: xml_image_pk_imgid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.xml_image_pk_imgid_seq OWNED BY public.xml_image.pk_imgid;


--
-- Name: xml_panel_pk_panelid_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.xml_panel_pk_panelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xml_panel_pk_panelid_seq OWNER TO admin;

--
-- Name: xml_panel_pk_panelid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.xml_panel_pk_panelid_seq OWNED BY public.xml_panel.pk_panelid;


--
-- Name: xml_board pk_boardid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_board ALTER COLUMN pk_boardid SET DEFAULT nextval('public.xml_board_pk_boardid_seq'::regclass);


--
-- Name: xml_component pk_compid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_component ALTER COLUMN pk_compid SET DEFAULT nextval('public.xml_component_pk_compid_seq'::regclass);


--
-- Name: xml_image pk_imgid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_image ALTER COLUMN pk_imgid SET DEFAULT nextval('public.xml_image_pk_imgid_seq'::regclass);


--
-- Name: xml_panel pk_panelid; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_panel ALTER COLUMN pk_panelid SET DEFAULT nextval('public.xml_panel_pk_panelid_seq'::regclass);


--
-- Name: dataset dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (dataset_uuid);


--
-- Name: export export_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.export
    ADD CONSTRAINT export_pkey PRIMARY KEY (export_uuid);


--
-- Name: first_normalize_form first_normalize_form_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.first_normalize_form
    ADD CONSTRAINT first_normalize_form_pkey PRIMARY KEY (image_uuid);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_uuid);


--
-- Name: ref_imagecode ref_imagecode_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ref_imagecode
    ADD CONSTRAINT ref_imagecode_pkey PRIMARY KEY (pk_codeid);


--
-- Name: ref_lightsource ref_lightsource_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ref_lightsource
    ADD CONSTRAINT ref_lightsource_pkey PRIMARY KEY (pk_sourceid);


--
-- Name: ref_resultcode ref_resultcode_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ref_resultcode
    ADD CONSTRAINT ref_resultcode_pkey PRIMARY KEY (pk_resultid);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (source_uuid);


--
-- Name: xml_board xml_board_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_board
    ADD CONSTRAINT xml_board_pkey PRIMARY KEY (pk_boardid);


--
-- Name: xml_component xml_component_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_component
    ADD CONSTRAINT xml_component_pkey PRIMARY KEY (pk_compid);


--
-- Name: xml_image xml_image_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_image
    ADD CONSTRAINT xml_image_pkey PRIMARY KEY (pk_imgid);


--
-- Name: xml_panel xml_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_panel
    ADD CONSTRAINT xml_panel_pkey PRIMARY KEY (pk_panelid);


--
-- Name: xml_picture xml_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.xml_picture
    ADD CONSTRAINT xml_picture_pkey PRIMARY KEY (fk_imgid);


--
-- Name: ref_tabletype xml_tabletype_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ref_tabletype
    ADD CONSTRAINT xml_tabletype_pkey PRIMARY KEY (pk_typeid);


--
-- Name: idx_fdate_panelid; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fdate_panelid ON public.xml_panel USING btree (fdate, pk_panelid) WITH (deduplicate_items='true');


--
-- Name: idx_fdate_stationid_cmodel_status; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fdate_stationid_cmodel_status ON public.xml_panel USING btree (fdate, stationid, cmodel, status) WITH (deduplicate_items='true');


--
-- Name: idx_panelid; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_panelid ON public.xml_board USING btree (fk_panelid) WITH (deduplicate_items='true');


--
-- Name: idx_panelid_compid; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_panelid_compid ON public.xml_image USING btree (fk_panelid, fk_compid) WITH (deduplicate_items='true');


--
-- Name: idx_panelid_fdate; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_panelid_fdate ON public.xml_panel USING btree (pk_panelid, fdate) WITH (deduplicate_items='true');


--
-- Name: dataset dataset_project_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT dataset_project_uuid_fkey FOREIGN KEY (project_uuid) REFERENCES public.project(project_uuid) ON DELETE CASCADE;


--
-- Name: export export_dataset_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.export
    ADD CONSTRAINT export_dataset_uuid_fkey FOREIGN KEY (dataset_uuid) REFERENCES public.dataset(dataset_uuid) ON DELETE CASCADE;


--
-- Name: first_normalize_form first_normalize_form_dataset_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.first_normalize_form
    ADD CONSTRAINT first_normalize_form_dataset_uuid_fkey FOREIGN KEY (dataset_uuid) REFERENCES public.dataset(dataset_uuid) ON DELETE CASCADE;


--
-- Name: first_normalize_form first_normalize_form_source_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.first_normalize_form
    ADD CONSTRAINT first_normalize_form_source_uuid_fkey FOREIGN KEY (source_uuid) REFERENCES public.source(source_uuid);


--
-- Name: second_normalize_form second_normalize_form_export_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.second_normalize_form
    ADD CONSTRAINT second_normalize_form_export_uuid_fkey FOREIGN KEY (export_uuid) REFERENCES public.export(export_uuid) ON DELETE CASCADE;


--
-- Name: second_normalize_form second_normalize_form_image_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.second_normalize_form
    ADD CONSTRAINT second_normalize_form_image_uuid_fkey FOREIGN KEY (image_uuid) REFERENCES public.first_normalize_form(image_uuid) ON DELETE CASCADE;


--
-- Name: source source_project_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_project_uuid_fkey FOREIGN KEY (project_uuid) REFERENCES public.project(project_uuid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

