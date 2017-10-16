sel top 10 * 
from
EDW_SCVER_CODA_ACCS_VIEWS.v_individual
where party_id = 188128377
;

sel top 10 * 
from
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address
where party_id = 188128377
;

sel top 10 * 
from
EDW_SCVER_CODA_ACCS_VIEWS.v_dim_address
where address_id = 330588906

;




sel  top 999999
fact.recipient_party_id , fact.event_actual_date, fact.mears_tag_id, fact.mears_tag_creation_dt, ind.LASTNAME, da.postcode
FROM
(select 
fct.recipient_party_id , fct.event_actual_date, fct.mears_tag_id, fct.mears_tag_creation_dt
--count(*)
--sample 999999
from
EDW_SCVER_CODA_BO_VIEWS.v_fct_piece_event fct
where event_actual_date >= date '2016-08-08'
and event_actual_date <= date '2016-08-30'
AND Mears_tag_id is not null
AND MEARS_TAG_ID >= 4174985560113
AND MEARS_TAG_ID <= 4174988778369
)fact
inner join 
EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
on ind.party_id = fact.recipient_party_id
and ind.lastname is not null
inner join 
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on pa.party_id = fact.recipient_party_id
inner join 
EDW_SCVER_CODA_ACCS_VIEWS.v_dim_address da
on pa.address_id = da.address_id
;


sel max(event_actual_date), min(event_actual_date)
from
EDW_SCVER_CODA_BO_VIEWS.v_fct_piece_event fct
;


select 
--fct.recipient_party_id , fct.event_actual_date, fct.mears_tag_id, fct.mears_tag_creation_dt
count(*)
--sample 999999
from
EDW_SCVER_CODA_BO_VIEWS.v_fct_piece_event fct
where event_actual_date < date '2016-08-08'
AND Mears_tag_id is not null
AND MEARS_TAG_ID >= 4174985560113
AND MEARS_TAG_ID <= 4174988778369
;



select top 500 * from
EDW_SCVER_CODA_ACCS_VIEWS.v_mears_shipper_piece
where Tag_Creation_Date = date '2016-08-08'
--and tag_id = 4174988778369
;





SELECT
databasename, tablename, columnname, indextype, indexnumber, indexname
FROM  
dbc.indices
WHERE databasename = 'EDW_SCVER'
ORDER BY
databasename,  tablename, indexnumber;