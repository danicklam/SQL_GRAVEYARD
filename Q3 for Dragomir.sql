select top 9999999
      vd.event_id event_id,
      vd.event_actual_dttm event_dttm,
      vpet.postal_event_type_desc postal_event_type_desc,
      vxr.exception_reason_desc exception_reason_desc,
      vppe.piece_id piece_id,
      NULL event_cd,
      NULL latitude,
      NULL longitude,
      vbbtd.barcode barcode,
      max(vpa.party_id) party_id,
      max(vpa.address_id) address_id,
      max(vda.postcode) postcode,
      max(vda.delivery_point_suffix_val) delivery_point,
      max(vdaoh.delivery_office) do_name
      from (select * from EDW_SCVER_CODA_ACCS_VIEWS.v_delivery
                        where (cast(event_actual_dttm as date) BETWEEN date '2016-01-01' and date '2016-01-31' OR cast(event_actual_dttm as date) = date '2016-01-31')
                        and source_system = 'RMGTT') vd
      left join (SELECT * FROM EDW_SCVER_BO_VIEWS.v_postal_event WHERE (event_actual_date BETWEEN date '2016-01-01' and date '2016-01-31' OR event_actual_date = date '2016-01-31')) vpe on vd.event_id = vpe.event_id
      left join (SELECT * FROM EDW_SCVER_BO_VIEWS.v_postal_exception WHERE (event_actual_date BETWEEN date '2016-01-01' and date '2016-01-31' OR event_actual_date = date '2016-01-31')) vpx on vd.event_id = vpx.event_id
      left join EDW_SCVER_BO_VIEWS.v_exception_reason vxr on vpx.exception_reason_id = vxr.exception_reason_id
      left join EDW_SCVER_BO_VIEWS.v_postal_event_type vpet on vpe.postal_event_type_id = vpet.postal_event_type_id
      left join (SELECT * FROM EDW_SCVER_BO_VIEWS.v_postal_piece_event WHERE (event_actual_date BETWEEN date '2016-01-01' and date '2016-01-31' OR event_actual_date = date '2016-01-31')) vppe ON vd.event_id = vppe.event_id
      LEFT JOIN (SELECT * FROM EDW_SCVER_BO_VIEWS.v_bo_base_track_data WHERE (scan_date BETWEEN date '2016-01-01' and date '2016-01-31' OR scan_date = date '2016-01-31') AND TRACK_NUMBER = 'TRACK7') vbbtd ON vppe.piece_id = vbbtd.piece_id
      inner join (select * from EDW_SCVER_CODA_ACCS_VIEWS.v_event_party
                                    where (event_actual_dt BETWEEN date '2016-01-01' and date '2016-01-31' OR event_actual_dt = date '2016-01-31')
                                    and Event_Party_Role_Id = 1) vep  --RECIPIENT
            --Note: this isn't 1 to 1. events can have multiple parties, hence the group by.
            on vep.event_id = vd.event_id
      inner join ( select * from EDW_SCVER_CODA_ACCS_VIEWS.v_party_address 
                                    where address_type_id = 1) vpa --Postal Address
            on vpa.party_id = vep.party_id
      inner join ( select * from EDW_SCVER_CODA_ACCS_VIEWS.v_dim_address 
                                    where address_type = 'MA') vda --MAIN ADDRESS
            on vda.address_id = vpa.address_id
      inner join (select * from EDW_SCVER_CODA_DIM_VIEWS.v_dim_address_ops_hierarchy 
                                                --where delivery_office = 'Cardiff North DO'
												where delivery_office IN (
												'Abingdon DO',
												'Alloa DO',
												'Andover DO',
												'Ashtead DO',
												'Ballymena DO',
												'Banbury DO',
												'Barnsley DO',
												'Bearsden DO',
												'Belfast BT15 DO',
												'Berkhamsted DO',
												'Bilston DO',
												'Blackpool DO',
												'Bracknell DO',
												'Bridgwater DO',
												'Bristol South DO',
												'Bude DO',
												'Burton On Trent DO',
												'Bury St Edmunds DO',
												'Cambridge DO',
												'Cardiff North DO',
												'Chelmsford DO',
												'Chester DO',
												'Clacton On Sea DO',
												'Colchester DO',
												'Coventry North DO',
												'Crewkerne DO',
												'Dalkeith DO',
												'Deptford DO',
												'Dover DO',
												'Dundee Central DO',
												'East Grinstead DO',
												'Edinburgh East DO',
												'Enniskillen DO',
												'Fareham DO',
												'Fordingbridge DO',
												'Gainsborough DO',
												'Glasgow G13 and G14 DO',
												'Glenrothes DO',
												'Great Missenden DO',
												'Halstead DO',
												'Harrow North and South DO',
												'Hayes DO',
												'Helston DO',
												'High Wycombe North DO',
												'Holyhead DO',
												'Hucknall DO',
												'Ilkeston DO',
												'Islington DO',
												'Iver DO',
												'Keswick DO',
												'Kingsbridge DO',
												'Kittybrewster DO',
												'Largs DO',
												'Leicester South DO',
												'Leyburn DO',
												'Liverpool 8 DO',
												'Llantwit Major DO',
												'Loughborough DO',
												'Maidenhead DO',
												'Manchester Central DO',
												'Marlow DO',
												'Mildenhall DO',
												'Montrose DO',
												'Mount Pleasant EC1 DO',
												'Nailsea DO',
												'Newark DO',
												'Newton Aycliffe DO',
												'Northampton NN3A DO',
												'Nottingham North DO',
												'Orpington DO',
												'Oxford East DO',
												'Patchway DO',
												'Petersfield DO',
												'Pontefract DO',
												'Portsmouth DO',
												'Pulborough DO',
												'Reading DO',
												'Ringwood DO',
												'Royston DO',
												'Sandhurst DO',
												'Seaton DO',
												'Sheffield West DO',
												'Skelmersdale DO',
												'Slough DO',
												'Southend On Sea DO',
												'St Albans DO',
												'Steyning DO',
												'Streatham DO',
												'Sutton DO',
												'Swindon DO',
												'Swindon West DO',
												'Tewkesbury DO',
												'Tong Road DO',
												'Turriff DO',
												'Wallingford DO',
												'Wembley Lows DO',
												'Westhill DO',
												'Wimbledon DO',
												'Worcester DO',
												'Ystalyfera DO')
												) vdaoh
            on vdaoh.address_id = vpa.address_id
      group by 1,2, 3, 4, 5, 6, 7, 8, 9;
