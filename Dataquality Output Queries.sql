SELECT * FROM
dbc.users WHERE 
username = 'lam_c'
;
   
drop table scverupdtable;

create volatile table SCVERUPDTABLE  as 
(
sel top 99999 recipient_party_id, recipient_address_id, 
CAST(CAST(SCVER_UPD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE
FROM
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event
where Event_Actual_Date = date '2016-09-01'
) WITH DATA --NO PRIMARY INDEX
NO PRIMARY INDEx
ON COMMIT PRESERVE ROWS
;

sel SCVDATE, count(*), count(distinct Recipient_Party_id), count (distinct Recipient_address_id)
from sCVERUPDTABLE
GROUP BY SCVDATE
;


-----------------------------------------------------------

sel event_actual_date, count(*), count (distinct recipient_party_id), count (distinct recipient_address_id)
FROM
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event
where Event_Actual_Date > date '2016-09-01'
and Event_Actual_Date < date '2016-09-01'
;
   
---------------------------------------------------------------------------------   

sel top 100
CAST(CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count(distinct Party_id), count(distinct Address_Id)
FROM 
EDW_SCVER_CODA_BO_VIEWS.v_party_address
WHERE SCVER_LOAD_DTTM > date '2016-06-30'
AND SCVER_LOAD_DTTM < date '2016-09-30'
GROUP BY SCVDATE
--HAVING SCVDATE = '2016-07-15'
;


sel top 100
CAST(CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count(Party_id) over (Partition by SCVDATE), 
count(Address_Id) over (Partition by SCVDATE)
FROM
EDW_SCVER_CODA_BO_VIEWS.v_party_address
GROUP BY SCVDATE
HAVING SCVDATE = '2016-07-15';

   

sel top 100
CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS SCVDATE,
count(distinct Party_id), count(distinct Address_Id)
FROM 
EDW_SCVER_CODA_BO_VIEWS.v_party_address
GROUP BY SCVDATE
HAVING SCVDATE = '2016-07-01';
   
   
   
   sel min(SCVER_Upd_Dttm)
   FROM
   EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event
   ;