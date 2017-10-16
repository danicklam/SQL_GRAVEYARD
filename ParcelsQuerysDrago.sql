------ QUERY PoC 3 - A Plus Route 200+ records 10 fields

SELECT TOP 999999
l.LOCATION_NAME_RLN do_name,
r.route_num route_number,
r.route_type_desc route_type_desc,
r.walk_type_desc walk_type_desc,
r.walking_route_ind walking_route_ind,
r.Route_name route_name,
r.route_status route_status,
r.delivery_tran_type delivery_tran_type,
r.record_status record_status,
r.change_status change_status,
NULL paired_route_number,
NULL paired_order,
NULL manual_route_type

FROM EDW_SCVER_BO_VIEWS.v_route r
INNER JOIN "EDW_SCVER_BO_VIEWS"."v_location" l
    ON r.ROUTE_OWNER_LOCATION_ID = l.LOCATION_ID
WHERE r.RECORD_STATUS LIKE '%A%'
    --and l.location_name_rln = 'Cardiff North DO' 
	--and l.location_name_rln = 'Slough DO'
	--and l.location_name_rln = 'Burton on Trent DO'
	and l.location_name_rln = 'Cambridge DO'
;


--CREATE MACRO aplus_macro(parameter1 VARCHAR(10000))
--AS (
SELECT TOP 9000000
l.LOCATION_NAME_RLN do_name,
r.route_num route_number,
r.Route_name route_name,
s.Route_Sequence_Num rsn,
a.Latitude_Meas latitude,
a.Longitude_Meas longitude,
a.Postcode postcode,
a.delivery_point_suffx_val delivery_point
FROM EDW_SCVER_BO_VIEWS.v_route r
INNER JOIN EDW_SCVER_BO_VIEWS.v_route_delivery_schedule s
    ON r.route_id = s.Delivery_Route_Id
INNER JOIN EDW_SCVER_BO_VIEWS.v_delivery_point_address a
    ON s.Point_Address_Id = a.Point_Address_Id
INNER JOIN "EDW_SCVER_BO_VIEWS"."v_location" l
    ON r.ROUTE_OWNER_LOCATION_ID = l.LOCATION_ID
WHERE r.RECORD_STATUS LIKE '%A%'
   AND s.Route_Dp_Del_Ind=0
    and l.location_name_rln in (
    'Gloucester Central DO','Gloucester North DO','Gloucester South DO'
     ,'Godalming DO','Golders Green DO','Goole DO','Goring On Sea DO'
     ,'Gorseinon DO','Gosforth DO','Gosport DO'
    
   ) ;

   
    -- 'Cardiff North DO' 
	--and l.location_name_rln = 'Slough DO'
	--and l.location_name_rln = 'Burton on Trent DO'
--	and l.location_name_rln = 'Cambridge DO'
--ORDER BY Route_ID, CAST(Route_Sequence_Num AS INT)


--'Gloucester Central DO','Gloucester North DO','Gloucester South DO'
--,'Godalming DO','Golders Green DO','Goole DO','Goring On Sea DO'
--,'Gorseinon DO','Gosforth DO','Gosport DO'

/*
Execute aplus_macro('Grange Over Sands DO');
Execute aplus_macro('Grangemouth DO');
Execute aplus_macro('Grantham DO');
Execute aplus_macro('Grantown On Spey DO');
Execute aplus_macro('Gravesend DO');
Execute aplus_macro('Grays DO');
Execute aplus_macro('Great Barr DO');
Execute aplus_macro('Great Missenden DO');
Execute aplus_macro('Great Yarmouth DO');
Execute aplus_macro('Greenwich DO');
Execute aplus_macro('Grimsby DO');
Execute aplus_macro('Guildford DO');
Execute aplus_macro('Guisborough DO');
Execute aplus_macro('Hackney DO');
Execute aplus_macro('Haddington DO');
Execute aplus_macro('Hadleigh DO');
Execute aplus_macro('Hailsham DO');
Execute aplus_macro('Halesworth DO');
Execute aplus_macro('Halfway DO');
Execute aplus_macro('Halifax DO');
Execute aplus_macro('Hall Green DO');
Execute aplus_macro('Halstead DO');
Execute aplus_macro('Hamilton DO');
Execute aplus_macro('Hammersmith DO');
Execute aplus_macro('Hampstead DO');
Execute aplus_macro('Hampton DO');
Execute aplus_macro('Handsworth DO');
Execute aplus_macro('Hanwell DO');
Execute aplus_macro('Harehills DO');
Execute aplus_macro('Harlow DO');
Execute aplus_macro('Harold Hill DO');
Execute aplus_macro('Harpenden DO');
Execute aplus_macro('Harpings Road DO');
Execute aplus_macro('Harrogate DO');
Execute aplus_macro('Harrow DO');
Execute aplus_macro('Harrow Kenton and Weald DO');
Execute aplus_macro('Harrow North and South DO');
Execute aplus_macro('Hartlepool DO');
Execute aplus_macro('Harwich DO');
Execute aplus_macro('Haslemere DO');
Execute aplus_macro('Hassocks DO');
Execute aplus_macro('Hastings DO');
Execute aplus_macro('Hatfield AL DO');
Execute aplus_macro('Hatton DO');
Execute aplus_macro('Havant DO');
Execute aplus_macro('Haverfordwest DO');
Execute aplus_macro('Haverhill DO');
Execute aplus_macro('Hawick DO');
Execute aplus_macro('Hawksworth DO');
Execute aplus_macro('Hayes DO');
Execute aplus_macro('Hayle DO');
Execute aplus_macro('Hayling Island DO');
Execute aplus_macro('Haywards Heath DO');
Execute aplus_macro('Hazel Grove DO');
Execute aplus_macro('Hazlemere DO');
Execute aplus_macro('Headington DO');
Execute aplus_macro('Heanor DO');
Execute aplus_macro('Heathfield DO');
Execute aplus_macro('Heaton DO');
Execute aplus_macro('Hebden Bridge DO');
Execute aplus_macro('Heckmondwike DO');
Execute aplus_macro('Hedge End DO');
Execute aplus_macro('Helensburgh DO');
Execute aplus_macro('Helston DO');
Execute aplus_macro('Hemel Hempstead DO');
Execute aplus_macro('Hendon DO');
Execute aplus_macro('Henfield DO');
Execute aplus_macro('Hengoed DO');
Execute aplus_macro('Henley In Arden DO');
Execute aplus_macro('Henley On Thames DO');
Execute aplus_macro('Hereford DO');
Execute aplus_macro('Herne Bay DO');
Execute aplus_macro('Herne Hill DO');
Execute aplus_macro('Hertford DO');
Execute aplus_macro('Heswall DO');
Execute aplus_macro('Hexham DO');
Execute aplus_macro('Heywood DO');
Execute aplus_macro('High Wycombe North DO');
Execute aplus_macro('High Wycombe South DO');
Execute aplus_macro('Highbury DO');
Execute aplus_macro('Highgate DO');
Execute aplus_macro('Hinckley DO');
Execute aplus_macro('Hitchin DO');
Execute aplus_macro('Hockley B DO');
Execute aplus_macro('Hockley SS DO');
Execute aplus_macro('Hoddesdon DO');
Execute aplus_macro('Holbeach DO');
Execute aplus_macro('Holbeck DO');
Execute aplus_macro('Holloway DO');
Execute aplus_macro('Holmfirth DO');
Execute aplus_macro('Holsworthy DO');
Execute aplus_macro('Holt DO');
Execute aplus_macro('Holyhead DO');
Execute aplus_macro('Holywood DO');
Execute aplus_macro('Home Counties North DO');
Execute aplus_macro('Homerton DO');
Execute aplus_macro('Honiton DO');
Execute aplus_macro('Hook DO');
Execute aplus_macro('Horley DO');
Execute aplus_macro('Horncastle DO');
Execute aplus_macro('Hornchurch DO');
Execute aplus_macro('Hornsey DO');
Execute aplus_macro('Horsham DO');
Execute aplus_macro('Houghton Le Spring DO');
Execute aplus_macro('Hounslow DO');
Execute aplus_macro('Hove DO');
Execute aplus_macro('Hoylake DO');
Execute aplus_macro('Hucknall DO');
Execute aplus_macro('Huddersfield DO');
Execute aplus_macro('Hull Central DO');
Execute aplus_macro('Hull Malmo Road DO');
Execute aplus_macro('Hungerford DO');
Execute aplus_macro('Hunslet DO');
Execute aplus_macro('Hunstanton DO');
Execute aplus_macro('Huntingdon DO');
Execute aplus_macro('Huntly DO');
Execute aplus_macro('Huyton DO');
Execute aplus_macro('Hyde DO');
Execute aplus_macro('Hythe CT DO');
Execute aplus_macro('Hythe SO DO');
Execute aplus_macro('Ilford DO');
Execute aplus_macro('Ilfracombe DO');
Execute aplus_macro('Ilkeston DO');
Execute aplus_macro('Ilkley DO');
Execute aplus_macro('Immingham DO');
Execute aplus_macro('Inverclyde DO');
Execute aplus_macro('Invergordon DO');
Execute aplus_macro('Inverness DO');
Execute aplus_macro('Inverurie DO');
Execute aplus_macro('Ipswich DO');
Execute aplus_macro('Ipswich East DO');
Execute aplus_macro('Ireland Wood DO');
Execute aplus_macro('Irlam DO');
Execute aplus_macro('Irvine DO');
Execute aplus_macro('Isleworth DO');
Execute aplus_macro('Islington DO');
Execute aplus_macro('Iver DO');
Execute aplus_macro('Ivybridge DO');
Execute aplus_macro('Jarrow DO');
Execute aplus_macro('Jedburgh DO');
Execute aplus_macro('Johnstone DO');
Execute aplus_macro('Keighley DO');
Execute aplus_macro('Keith DO');
Execute aplus_macro('Kelso DO');
Execute aplus_macro('Kendal DO');
Execute aplus_macro('Kenilworth DO');
Execute aplus_macro('Kennington DO');
Execute aplus_macro('Kensington DO');
Execute aplus_macro('Kentish Town DO');
Execute aplus_macro('Keswick DO');
Execute aplus_macro('Kettering DO');
Execute aplus_macro('Keynsham DO');
Execute aplus_macro('Kidderminster DO');
Execute aplus_macro('Kidlington DO');
Execute aplus_macro('Kidsgrove DO');
Execute aplus_macro('Kilburn DO');
Execute aplus_macro('Kilmarnock DO');
Execute aplus_macro('Kilsyth DO');
Execute aplus_macro('Kilwinning DO');
Execute aplus_macro('Kings Langley DO');
Execute aplus_macro('Kings Lynn DO');
Execute aplus_macro('Kings Norton DO');
Execute aplus_macro('Kingsbridge DO');
Execute aplus_macro('Kingston Upon Thames DO');
Execute aplus_macro('Kingswinford DO');
Execute aplus_macro('Kingswood DO');
Execute aplus_macro('Kinross DO');
Execute aplus_macro('Kirby Bellars DO');
Execute aplus_macro('Kirkby DO');
Execute aplus_macro('Kirkby In Ashfield DO');
Execute aplus_macro('Kirkcaldy DO');
Execute aplus_macro('Kirkintilloch DO');
Execute aplus_macro('Kirkwall DO');
Execute aplus_macro('Kirriemuir DO');
Execute aplus_macro('Kitts Green DO');
Execute aplus_macro('Kittybrewster DO');
Execute aplus_macro('Knaphill DO');
Execute aplus_macro('Knaresborough DO');
Execute aplus_macro('Knighton DO');
Execute aplus_macro('Knowle DO');
Execute aplus_macro('Knutsford DO');
Execute aplus_macro('Kyle DO');
Execute aplus_macro('Lairg DO');
Execute aplus_macro('Lambeth DO');
Execute aplus_macro('Lampeter DO');
Execute aplus_macro('Lanark DO');
Execute aplus_macro('Lancaster DO');
Execute aplus_macro('Lancing DO');
Execute aplus_macro('Landywood DO');
Execute aplus_macro('Langport DO');
Execute aplus_macro('Largs DO');
Execute aplus_macro('Lark Lane DO');
Execute aplus_macro('Larkhall DO');
Execute aplus_macro('Larne DO');
Execute aplus_macro('Launceston DO');
Execute aplus_macro('Laurencekirk DO');
Execute aplus_macro('Leagrave DO');
Execute aplus_macro('Leamington Spa DO');
Execute aplus_macro('Leatherhead DO');
Execute aplus_macro('Ledbury DO');
Execute aplus_macro('Lee DO');
Execute aplus_macro('Leeds City DO');
Execute aplus_macro('Leek DO');
Execute aplus_macro('Leicester Central DO');
Execute aplus_macro('Leicester East DO');
Execute aplus_macro('Leicester North DO');
Execute aplus_macro('Leicester South DO');
Execute aplus_macro('Leicester South East DO');
Execute aplus_macro('Leicester West DO');
Execute aplus_macro('Leigh DO');
Execute aplus_macro('Leigh On Sea DO');
Execute aplus_macro('Leighton Buzzard DO');
Execute aplus_macro('Leiston DO');
Execute aplus_macro('Leith 5 DO');
Execute aplus_macro('Leith 6 DO');
Execute aplus_macro('Leominster DO');
Execute aplus_macro('Lerwick DO');
Execute aplus_macro('Letchworth DO');
Execute aplus_macro('Leven DO');
Execute aplus_macro('Levenshulme DO');
Execute aplus_macro('Lewes DO');
Execute aplus_macro('Lewisham DO');
Execute aplus_macro('Leyburn DO');
Execute aplus_macro('Leyland DO');
Execute aplus_macro('Leyton DO');
Execute aplus_macro('Leytonstone DO');
Execute aplus_macro('Lichfield DO');
Execute aplus_macro('Limavady DO');
Execute aplus_macro('Lincoln DO');
Execute aplus_macro('Lingfield DO');
Execute aplus_macro('Linlithgow DO');
Execute aplus_macro('Liphook DO');
Execute aplus_macro('Lisburn DO');
Execute aplus_macro('Liskeard DO');
Execute aplus_macro('Liss DO');
Execute aplus_macro('Littlehampton DO');
Execute aplus_macro('Liverpool 1 to3 DO');
Execute aplus_macro('Liverpool 4 to 5 DO');
Execute aplus_macro('Liverpool 6 to 7 DO');
Execute aplus_macro('Liverpool 8 DO');
Execute aplus_macro('Liverpool North DO');
Execute aplus_macro('Liverpool South DO');
Execute aplus_macro('Liverpool South East DO');
Execute aplus_macro('Livingston DO');
Execute aplus_macro('Llandeilo DO');
Execute aplus_macro('Llandovery DO');
Execute aplus_macro('Llandrindod Wells DO');
Execute aplus_macro('Llandudno DO');
Execute aplus_macro('Llandysul DO');
Execute aplus_macro('Llanelli DO');
Execute aplus_macro('Llangefni DO');
Execute aplus_macro('Llanidloes DO');
Execute aplus_macro('Llanrwst DO');
Execute aplus_macro('Llantwit Major DO');
Execute aplus_macro('Lochgelly DO');
Execute aplus_macro('Lochgilphead DO');
Execute aplus_macro('Lochmaddy DO');
Execute aplus_macro('Lockerbie DO');
Execute aplus_macro('London Camden DO');
Execute aplus_macro('London Victoria DO');
Execute aplus_macro('London Victoria Docks DO');
Execute aplus_macro('Londonderry DO');
Execute aplus_macro('Long Eaton DO');
Execute aplus_macro('Longfield DO');
Execute aplus_macro('Longridge DO');
Execute aplus_macro('Longton DO');
Execute aplus_macro('Looe DO');
Execute aplus_macro('Lossiemouth DO');
Execute aplus_macro('Loughborough DO');
Execute aplus_macro('Loughton DO');
Execute aplus_macro('Louth DO');
Execute aplus_macro('Lower Edmonton DO');
Execute aplus_macro('Lowestoft DO');
Execute aplus_macro('Ludlow DO');
Execute aplus_macro('Luton DO');
Execute aplus_macro('Lutterworth DO');
Execute aplus_macro('Lydney DO');
Execute aplus_macro('Lymington DO');
Execute aplus_macro('Lymm DO');
Execute aplus_macro('Lytham St Annes DO');
Execute aplus_macro('Mablethorpe DO');
Execute aplus_macro('Macclesfield DO');
Execute aplus_macro('Machynlleth DO');
Execute aplus_macro('Maesteg DO');
Execute aplus_macro('Magherafelt DO');
Execute aplus_macro('Maghull DO');
Execute aplus_macro('Maida Hill DO');
Execute aplus_macro('Maidenhead DO');
Execute aplus_macro('Maidstone DO');
Execute aplus_macro('Maldon DO');
Execute aplus_macro('Malmesbury DO');
Execute aplus_macro('Maltby DO');
Execute aplus_macro('Malton DO');
Execute aplus_macro('Malvern DO');
Execute aplus_macro('Manchester Central DO');
Execute aplus_macro('Manchester East DO');
Execute aplus_macro('Manchester North DO');
Execute aplus_macro('Manchester North East DO');
Execute aplus_macro('Manchester North West DO');
Execute aplus_macro('Manchester South DO');
Execute aplus_macro('Manchester South East DO');
Execute aplus_macro('Manchester South West DO');
Execute aplus_macro('Manningtree DO');
Execute aplus_macro('Manor Park DO');
Execute aplus_macro('Mansfield DO');
Execute aplus_macro('Mansfield Woodhouse DO');
Execute aplus_macro('Manvers DO');
Execute aplus_macro('March DO');
Execute aplus_macro('Margate DO');
Execute aplus_macro('Market Drayton DO');
Execute aplus_macro('Market Harborough DO');
Execute aplus_macro('Market Rasen DO');
Execute aplus_macro('Marlborough DO');
Execute aplus_macro('Marlow DO');
Execute aplus_macro('Marple DO');
Execute aplus_macro('Maryport DO');
Execute aplus_macro('Mastrick DO');
Execute aplus_macro('Matlock DO');
Execute aplus_macro('Medway Valley DO');
Execute aplus_macro('Melksham DO');
Execute aplus_macro('Melrose DO');
Execute aplus_macro('Melton Mowbray DO');
Execute aplus_macro('Merthyr Tydfil DO');
Execute aplus_macro('Mid Rhondda Ganol DO');
Execute aplus_macro('Middlesbrough DO');
Execute aplus_macro('Middleton DO');
Execute aplus_macro('Midhurst DO');
Execute aplus_macro('Mildenhall DO');
Execute aplus_macro('Mill Hill DO');
Execute aplus_macro('Millom DO');
Execute aplus_macro('Milngavie DO');
Execute aplus_macro('Milton Keynes Kiln Farm DO');
Execute aplus_macro('Minehead DO');
Execute aplus_macro('Mirfield DO');
Execute aplus_macro('Mitcham DO');
Execute aplus_macro('Mold DO');
Execute aplus_macro('Molesey DO');
Execute aplus_macro('Monmouth DO');
Execute aplus_macro('Montrose DO');
Execute aplus_macro('Moortown DO');
Execute aplus_macro('Morden DO');
Execute aplus_macro('Morecambe DO');
Execute aplus_macro('Moreton DO');
Execute aplus_macro('Morley DO');
Execute aplus_macro('Morpeth DO');
Execute aplus_macro('Mortimer DO');
Execute aplus_macro('Mortlake DO');
Execute aplus_macro('Moseley DO');
Execute aplus_macro('Mossley Hill DO');
Execute aplus_macro('Motherwell DO');
Execute aplus_macro('Mount Pleasant EC1 DO');
Execute aplus_macro('Mount Pleasant EC3 DO');
Execute aplus_macro('Mount Pleasant EC4 DO');
Execute aplus_macro('Mount Pleasant W DO');
Execute aplus_macro('Mount Pleasant WC DO');
Execute aplus_macro('Mountain Ash DO');
Execute aplus_macro('Much Wenlock DO');
Execute aplus_macro('Mumbles DO');
Execute aplus_macro('Musselburgh DO');
Execute aplus_macro('Muswell Hill DO');
Execute aplus_macro('Nailsea DO');
Execute aplus_macro('Nairn DO');
Execute aplus_macro('Nantwich DO');
Execute aplus_macro('Narberth DO');
Execute aplus_macro('Neath DO');
Execute aplus_macro('Neston DO');
Execute aplus_macro('New Cross DO');
Execute aplus_macro('New Ferry DO');
Execute aplus_macro('New Malden DO');
Execute aplus_macro('New Mills DO');
Execute aplus_macro('New Milton DO');
Execute aplus_macro('New Romney DO');
Execute aplus_macro('New Southgate DO');
Execute aplus_macro('Newark DO');
Execute aplus_macro('Newbury DO');
Execute aplus_macro('Newcastle Under Lyme DO');
Execute aplus_macro('Newcastle Upon Tyne City DO');
Execute aplus_macro('Newcastle West DO');
Execute aplus_macro('Newhaven DO');
Execute aplus_macro('Newmarket DO');
Execute aplus_macro('Newport East DO');
Execute aplus_macro('Newport IOW DO');
Execute aplus_macro('Newport Pagnell DO');
Execute aplus_macro('Newport TF DO');
Execute aplus_macro('Newport West DO');
Execute aplus_macro('Newquay DO');
Execute aplus_macro('Newry DO');
Execute aplus_macro('Newton Abbot DO');
Execute aplus_macro('Newton Aycliffe DO');
Execute aplus_macro('Newton Le Willows DO');
Execute aplus_macro('Newton Mearns DO');
Execute aplus_macro('Newton Stewart DO');
Execute aplus_macro('Newtown DO');
Execute aplus_macro('Newtownabbey DO');
Execute aplus_macro('Newtownards DO');
Execute aplus_macro('Normanton DO');
Execute aplus_macro('North Berwick DO');
Execute aplus_macro('North Finchley DO');
Execute aplus_macro('North Kensington DO');
Execute aplus_macro('North London DO');
Execute aplus_macro('North Tyneside DO');
Execute aplus_macro('North Walsham DO');
Execute aplus_macro('Northallerton DO');
Execute aplus_macro('Northampton Crow Lane DO');
Execute aplus_macro('Northampton NN3A DO');
Execute aplus_macro('Northampton NN3B DO');
Execute aplus_macro('Northampton Rurals DO');
Execute aplus_macro('Northampton South NN4A DO');
Execute aplus_macro('Northampton South NN4B DO');
Execute aplus_macro('Northampton St James Mill DO');
Execute aplus_macro('Northampton West DO');
Execute aplus_macro('Northfield DO');
Execute aplus_macro('Northolt DO');
Execute aplus_macro('Northwich DO');
Execute aplus_macro('Northwood DO');
Execute aplus_macro('Norwich DO');
Execute aplus_macro('Norwood DO');
Execute aplus_macro('Notting Hill DO');
Execute aplus_macro('Nottingham City DO');
Execute aplus_macro('Nottingham East DO');
Execute aplus_macro('Nottingham North DO');
Execute aplus_macro('Nottingham South DO');
Execute aplus_macro('Nuneaton DO');
Execute aplus_macro('Oadby DO');
Execute aplus_macro('Oakengates DO');
Execute aplus_macro('Oakham DO');
Execute aplus_macro('Oban DO');
Execute aplus_macro('Okehampton DO');
Execute aplus_macro('Oldbury DO');
Execute aplus_macro('Oldham DO');
Execute aplus_macro('Olney DO');
Execute aplus_macro('Omagh DO');
Execute aplus_macro('Ongar DO');
Execute aplus_macro('Openshaw DO');
Execute aplus_macro('Ormskirk DO');
Execute aplus_macro('Orpington DO');
Execute aplus_macro('Orton Southgate DO');
Execute aplus_macro('Ossett DO');
Execute aplus_macro('Oswestry DO');
Execute aplus_macro('Otley DO');
Execute aplus_macro('Oundle DO');
Execute aplus_macro('Oxford DO');
Execute aplus_macro('Oxford East DO');
Execute aplus_macro('Oxted DO');
Execute aplus_macro('Paddington DO');
Execute aplus_macro('Paignton DO');
Execute aplus_macro('Paisley DO');
Execute aplus_macro('Palmers Green DO');
Execute aplus_macro('Pangbourne DO');
Execute aplus_macro('Parkstone DO');
Execute aplus_macro('Patchway DO');
Execute aplus_macro('Peacehaven DO');
Execute aplus_macro('Peckham DO');
Execute aplus_macro('Peebles DO');
Execute aplus_macro('Pembroke Dock DO');
Execute aplus_macro('Penarth DO');
Execute aplus_macro('Pendle DO');
Execute aplus_macro('Penicuik DO');
Execute aplus_macro('Penrith DO');
Execute aplus_macro('Penzance DO');
Execute aplus_macro('Pershore DO');
Execute aplus_macro('Perth DO');
Execute aplus_macro('Peterborough DO');
Execute aplus_macro('Peterborough South DO');
Execute aplus_macro('Peterhead DO');
Execute aplus_macro('Peterlee DO');
Execute aplus_macro('Petersfield DO');
Execute aplus_macro('Petworth DO');
Execute aplus_macro('Pewsey DO');
Execute aplus_macro('Pickering DO');
Execute aplus_macro('Pinner DO');
Execute aplus_macro('Pitlochry DO');
Execute aplus_macro('Plaistow DO');
Execute aplus_macro('Plymouth 4 DO');
Execute aplus_macro('Plymouth DO');
Execute aplus_macro('Plymouth North DO');
Execute aplus_macro('Plympton DO');
Execute aplus_macro('Plymstock DO');
Execute aplus_macro('Pocklington DO');
Execute aplus_macro('Polegate DO');
Execute aplus_macro('Pontardawe DO');
Execute aplus_macro('Pontefract DO');
Execute aplus_macro('Ponteland DO');
Execute aplus_macro('Pontyclun DO');
Execute aplus_macro('Pontypool DO');
Execute aplus_macro('Pontypridd DO');
Execute aplus_macro('Poole Alder Hills DO');
Execute aplus_macro('Poole DO');
Execute aplus_macro('Port Ellen DO');
Execute aplus_macro('Port Talbot DO');
Execute aplus_macro('Porthcawl DO');
Execute aplus_macro('Porthmadog DO');
Execute aplus_macro('Portishead DO');
Execute aplus_macro('Portland DO');
Execute aplus_macro('Portobello DO');
Execute aplus_macro('Portree DO');
Execute aplus_macro('Portslade DO');
Execute aplus_macro('Portsmouth DO');
Execute aplus_macro('Potters Bar DO');
Execute aplus_macro('Poulton Le Fylde DO');
Execute aplus_macro('Prenton DO');
Execute aplus_macro('Prescot DO');
Execute aplus_macro('Prestatyn DO');
Execute aplus_macro('Preston Central DO');
Execute aplus_macro('Preston South DO');
Execute aplus_macro('Preston West DO');
Execute aplus_macro('Prestonpans DO');
Execute aplus_macro('Prestwich DO');
Execute aplus_macro('Prestwick DO');
Execute aplus_macro('Princes Risborough DO');
Execute aplus_macro('Prudhoe DO');
Execute aplus_macro('Pudsey DO');
Execute aplus_macro('Pulborough DO');
Execute aplus_macro('Purley DO');
Execute aplus_macro('Putney DO');
Execute aplus_macro('Pwllheli DO');
Execute aplus_macro('Quinton DO');
Execute aplus_macro('Radcliffe DO');
Execute aplus_macro('Radlett DO');
Execute aplus_macro('Radstock DO');
Execute aplus_macro('Rainham ME DO');
Execute aplus_macro('Rainham RM DO');
Execute aplus_macro('Ramsey PE DO');
Execute aplus_macro('Ramsgate DO');
Execute aplus_macro('Rayleigh DO');
Execute aplus_macro('Reading DO');
Execute aplus_macro('Reading East DO');
Execute aplus_macro('Reading West DO');
Execute aplus_macro('Redcar DO');
Execute aplus_macro('Redditch DO');
Execute aplus_macro('Redfern Park DO');
Execute aplus_macro('Redhill DO');
Execute aplus_macro('Rednal DO');
Execute aplus_macro('Redruth DO');
Execute aplus_macro('Reigate DO');
Execute aplus_macro('Renfrew DO');
Execute aplus_macro('Retford DO');
Execute aplus_macro('Rhyl DO');
Execute aplus_macro('Ribblesdale DO');
Execute aplus_macro('Richmond DL DO');
Execute aplus_macro('Richmond Upon Thames DO');
Execute aplus_macro('Rickmansworth DO');
Execute aplus_macro('Ringwood DO');
Execute aplus_macro('Ripley DE DO');
Execute aplus_macro('Ripon DO');
Execute aplus_macro('Riseley RG DO');
Execute aplus_macro('Rochdale DO');
Execute aplus_macro('Rochester DO');
Execute aplus_macro('Rochford DO');
Execute aplus_macro('Romford DO');
Execute aplus_macro('Romsey DO');
Execute aplus_macro('Ross On Wye DO');
Execute aplus_macro('Rossendale DO');
Execute aplus_macro('Rotherham DO');
Execute aplus_macro('Rotherhithe DO');
Execute aplus_macro('Rothesay DO');
Execute aplus_macro('Rottingdean DO');
Execute aplus_macro('Royston DO');
Execute aplus_macro('Rugby DO');
Execute aplus_macro('Rugeley DO');
Execute aplus_macro('Ruislip DO');
Execute aplus_macro('Runcorn DO');
Execute aplus_macro('Rushden DO');
Execute aplus_macro('Ruthin DO');
Execute aplus_macro('Ryde DO');
Execute aplus_macro('Rye DO');
Execute aplus_macro('Saffron Walden DO');
Execute aplus_macro('Sale DO');
Execute aplus_macro('Salford DO');
Execute aplus_macro('Salisbury DO');
Execute aplus_macro('Saltash DO');
Execute aplus_macro('Saltcoats DO');
Execute aplus_macro('Sandbach DO');
Execute aplus_macro('Sandhurst DO');
Execute aplus_macro('Sandown DO');
Execute aplus_macro('Sandwich DO');
Execute aplus_macro('Sandy DO');
Execute aplus_macro('Sarisbury Green DO');
Execute aplus_macro('Saxmundham DO');
Execute aplus_macro('Saxon Way DO');
Execute aplus_macro('Scarborough DO');
Execute aplus_macro('Scissett DO');
Execute aplus_macro('Scottish RDC Delivery');
Execute aplus_macro('Scunthorpe DO');
Execute aplus_macro('Seacroft DO');
Execute aplus_macro('Seaford DO');
Execute aplus_macro('Seaforth DO');
Execute aplus_macro('Seaham DO');
Execute aplus_macro('Seaton DO');
Execute aplus_macro('Selby DO');
Execute aplus_macro('Selkirk DO');
Execute aplus_macro('Sevenoaks DO');
Execute aplus_macro('Shaftesbury DO');
Execute aplus_macro('Sheepscar DO');
Execute aplus_macro('Sheerness DO');
Execute aplus_macro('Sheffield 1 DO');
Execute aplus_macro('Sheffield City DO');
Execute aplus_macro('Sheffield E DO');
Execute aplus_macro('Sheffield North DO');
Execute aplus_macro('Sheffield North East DO');
Execute aplus_macro('Sheffield South DO');
Execute aplus_macro('Sheffield South East DO');
Execute aplus_macro('Sheffield South West DO');
Execute aplus_macro('Sheffield West DO');
Execute aplus_macro('Shepperton DO');
Execute aplus_macro('Shepshed DO');
Execute aplus_macro('Shepton Mallet DO');
Execute aplus_macro('Sherborne DO');
Execute aplus_macro('Sherburn DO');
Execute aplus_macro('Sheringham DO');
Execute aplus_macro('Shipley DO');
Execute aplus_macro('Shirley B DO');
Execute aplus_macro('Shirley SO DO');
Execute aplus_macro('Shoeburyness DO');
Execute aplus_macro('Shoreham By Sea DO');
Execute aplus_macro('Shotts DO');
Execute aplus_macro('Shrewsbury DO');
Execute aplus_macro('Sidcup DO');
Execute aplus_macro('Sidmouth DO');
Execute aplus_macro('Sittingbourne DO');
Execute aplus_macro('Skegness DO');
Execute aplus_macro('Skelmersdale DO');
Execute aplus_macro('Skelton in Cleveland DO');
Execute aplus_macro('Skipton DO');
Execute aplus_macro('Slaithwaite DO');
Execute aplus_macro('Sleaford DO');
Execute aplus_macro('Slough DO');
Execute aplus_macro('Smethwick DO');
Execute aplus_macro('Solihull DO');
Execute aplus_macro('Somerton DO');
Execute aplus_macro('South Bank DO');
Execute aplus_macro('South Croydon DO');
Execute aplus_macro('South Kensington DO');
Execute aplus_macro('South Molton DO');
Execute aplus_macro('South Norwood DO');
Execute aplus_macro('South Ockendon DO');
Execute aplus_macro('South Shields DO');
Execute aplus_macro('South Shore DO');
Execute aplus_macro('South Tottenham DO');
Execute aplus_macro('South Tottenham DO');
Execute aplus_macro('South Woodford DO');
Execute aplus_macro('South Woodham Ferrers DO');
Execute aplus_macro('Southall DO');
Execute aplus_macro('Southam DO');
Execute aplus_macro('Southend On Sea DO');
Execute aplus_macro('Southgate DO');
Execute aplus_macro('Southport DO');
Execute aplus_macro('Southwark DO');
Execute aplus_macro('Southwold DO');
Execute aplus_macro('Spalding DO');
Execute aplus_macro('Speke DO');
Execute aplus_macro('Spennymoor DO');
Execute aplus_macro('Spilsby DO');
Execute aplus_macro('St Albans DO');
Execute aplus_macro('St Andrews DO');
Execute aplus_macro('St Austell DO');
Execute aplus_macro('St Helens DO');
Execute aplus_macro('St Ives PE DO');
Execute aplus_macro('St Ives TR DO');
Execute aplus_macro('St Johns Wood DO');
Execute aplus_macro('St Leonards On Sea DO');
Execute aplus_macro('St Neots DO');
Execute aplus_macro('Stafford DO');
Execute aplus_macro('Staines DO');
Execute aplus_macro('Stamford DO');
Execute aplus_macro('Stanford Le Hope DO');
Execute aplus_macro('Stanmore DO');
Execute aplus_macro('Staveley DO');
Execute aplus_macro('Stevenage DO');
Execute aplus_macro('Steyning DO');
Execute aplus_macro('Stirling DO');
Execute aplus_macro('Stockport 2 DO');
Execute aplus_macro('Stockport 3 DO');
Execute aplus_macro('Stockport 4 DO');
Execute aplus_macro('Stockport 5 DO');
Execute aplus_macro('Stockport Central DO');
Execute aplus_macro('Stocksbridge DO');
Execute aplus_macro('Stockton On Tees DO');
Execute aplus_macro('Stockwell DO');
Execute aplus_macro('Stoke Newington DO');
Execute aplus_macro('Stoke on Trent DO');
Execute aplus_macro('Stone DO');
Execute aplus_macro('Stonehaven DO');
Execute aplus_macro('Stornoway DO');
Execute aplus_macro('Storrington DO');
Execute aplus_macro('Stourbridge DO');
Execute aplus_macro('Stourport On Severn DO');
Execute aplus_macro('Stowmarket DO');
Execute aplus_macro('Strabane DO');
Execute aplus_macro('Stranraer DO');
Execute aplus_macro('Stratford DO');
Execute aplus_macro('Stratford Upon Avon DO');
Execute aplus_macro('Streatham DO');
Execute aplus_macro('Stretford DO');
Execute aplus_macro('Stromness DO');
Execute aplus_macro('Stroud DO');
Execute aplus_macro('Sturminster Newton DO');
Execute aplus_macro('Sudbury DO');
Execute aplus_macro('Sunbury On Thames DO');
Execute aplus_macro('Sunderland DO');
Execute aplus_macro('Sutton Coldfield DO');
Execute aplus_macro('Sutton DO');
Execute aplus_macro('Sutton In Ashfield DO');
Execute aplus_macro('Swadlincote DO');
Execute aplus_macro('Swaffham DO');
Execute aplus_macro('Swan House DO');
Execute aplus_macro('Swanage DO');
Execute aplus_macro('Swanley DO');
Execute aplus_macro('Swanscombe DO');
Execute aplus_macro('Swansea DO');
Execute aplus_macro('Swindon DO');
Execute aplus_macro('Swindon West DO');
Execute aplus_macro('Sydenham DO');
Execute aplus_macro('Tadcaster DO');
Execute aplus_macro('Tadley DO');
Execute aplus_macro('Tadworth DO');
Execute aplus_macro('Tain DO');
Execute aplus_macro('Tamworth DO');
Execute aplus_macro('Tarporley DO');
Execute aplus_macro('Taunton DO');
Execute aplus_macro('Tavistock DO');
Execute aplus_macro('Teddington DO');
Execute aplus_macro('Teignmouth DO');
Execute aplus_macro('Tenby DO');
Execute aplus_macro('Tenterden DO');
Execute aplus_macro('Tetbury DO');
Execute aplus_macro('Tewkesbury DO');
Execute aplus_macro('Thame DO');
Execute aplus_macro('Thamesmead DO');
Execute aplus_macro('Thatcham DO');
Execute aplus_macro('The Hyde DO');
Execute aplus_macro('The Queen Elizabeth DO');
Execute aplus_macro('Thetford DO');
Execute aplus_macro('Thirsk DO');
Execute aplus_macro('Thornbury DO');
Execute aplus_macro('Thornhill DO');
Execute aplus_macro('Thornton Heath DO');
Execute aplus_macro('Thurso DO');
Execute aplus_macro('Tidworth DO');
Execute aplus_macro('Tipton DO');
Execute aplus_macro('Tiptree DO');
Execute aplus_macro('Tiverton DO');
Execute aplus_macro('Todmorden DO');
Execute aplus_macro('Tonbridge DO');
Execute aplus_macro('Tong Road DO');
Execute aplus_macro('Tooting DO');
Execute aplus_macro('Topsham DO');
Execute aplus_macro('Torquay DO');
Execute aplus_macro('Torrington DO');
Execute aplus_macro('Totnes DO');
Execute aplus_macro('Tottenham DO');
Execute aplus_macro('Totton DO');
Execute aplus_macro('Tranent DO');
Execute aplus_macro('Tredegar DO');
Execute aplus_macro('Treharris DO');
Execute aplus_macro('Treorchy DO');
Execute aplus_macro('Tring DO');
Execute aplus_macro('Troon DO');
Execute aplus_macro('Trowbridge DO');
Execute aplus_macro('Truro DO');
Execute aplus_macro('Tunbridge Wells DO');
Execute aplus_macro('Turriff DO');
Execute aplus_macro('Tweedale DO');
Execute aplus_macro('Twickenham DO');
Execute aplus_macro('Tyldesley DO');
Execute aplus_macro('Uckfield DO');
Execute aplus_macro('Uddingston DO');
Execute aplus_macro('Ulverston DO');
Execute aplus_macro('Upminster DO');
Execute aplus_macro('Upper Edmonton DO');
Execute aplus_macro('Upper Holloway DO');
Execute aplus_macro('Upton DO');
Execute aplus_macro('Urmston DO');
Execute aplus_macro('Usk DO');
Execute aplus_macro('Uttoxeter DO');
Execute aplus_macro('Uxbridge DO');
Execute aplus_macro('Vale Of Glamorgan DO');
Execute aplus_macro('Valley DO');
Execute aplus_macro('Ventnor DO');
Execute aplus_macro('Verwood DO');
Execute aplus_macro('Virginia Water DO');
Execute aplus_macro('Wadebridge DO');
Execute aplus_macro('Wakefield DO');
Execute aplus_macro('Wakefield Subs WF 3 and 4 DO');
Execute aplus_macro('Wallasey DO');
Execute aplus_macro('Wallingford DO');
Execute aplus_macro('Wallington DO');
Execute aplus_macro('Walsall DO');
Execute aplus_macro('Waltham Cross DO');
Execute aplus_macro('Walthamstow DO');
Execute aplus_macro('Walton DO');
Execute aplus_macro('Walton On Thames DO');
Execute aplus_macro('Walton On The Naze DO');
Execute aplus_macro('Walworth DO');
Execute aplus_macro('Wandsworth DO');
Execute aplus_macro('Wantage DO');
Execute aplus_macro('Ware DO');
Execute aplus_macro('Wareham DO');
Execute aplus_macro('Warminster DO');
Execute aplus_macro('Warrington DO');
Execute aplus_macro('Warwick DO');
Execute aplus_macro('Washington DO');
Execute aplus_macro('Waterlooville DO');
Execute aplus_macro('Watford (WD18) Delivery Office');
Execute aplus_macro('Watford DO');
Execute aplus_macro('Wear Valley DO');
Execute aplus_macro('Wednesbury DO');
Execute aplus_macro('Wellingborough DO');
Execute aplus_macro('Wellington TA DO');
Execute aplus_macro('Wellington TF DO');
Execute aplus_macro('Wells DO');
Execute aplus_macro('Welshpool DO');
Execute aplus_macro('Welwyn Garden City DO');
Execute aplus_macro('Wem DO');
Execute aplus_macro('Wembley Highs DO');
Execute aplus_macro('Wembley Lows DO');
Execute aplus_macro('West Bradford DO');
Execute aplus_macro('West Brompton DO');
Execute aplus_macro('West Bromwich DO');
Execute aplus_macro('West Byfleet DO');
Execute aplus_macro('West Derby DO');
Execute aplus_macro('West Ealing DO');
Execute aplus_macro('West Kensington DO');
Execute aplus_macro('West London DO');
Execute aplus_macro('West London DO ');
Execute aplus_macro('West Norwood DO');
Execute aplus_macro('West Park DO');
Execute aplus_macro('West Wickham DO');
Execute aplus_macro('West Wimbledon DO');
Execute aplus_macro('Westbourne DO');
Execute aplus_macro('Westbury DO');
Execute aplus_macro('Westbury On Trym DO');
Execute aplus_macro('Westham DO');
Execute aplus_macro('Westhill DO');
Execute aplus_macro('Weston Super Mare DO');
Execute aplus_macro('Wetherby DO');
Execute aplus_macro('Weybridge DO');
Execute aplus_macro('Weymouth DO');
Execute aplus_macro('Wharfedale DO');
Execute aplus_macro('Whetstone DO');
Execute aplus_macro('Whitby DO');
Execute aplus_macro('Whitchurch DO');
Execute aplus_macro('Whitchurch RG DO');
Execute aplus_macro('Whitechapel DO');
Execute aplus_macro('Whitehaven DO');
Execute aplus_macro('Whitland DO');
Execute aplus_macro('Whitstable DO');
Execute aplus_macro('Whitwood DO');
Execute aplus_macro('Wick DO');
Execute aplus_macro('Wickford DO');
Execute aplus_macro('Widnes DO');
Execute aplus_macro('Wigan DO');
Execute aplus_macro('Wigston DO');
Execute aplus_macro('Wigton DO');
Execute aplus_macro('Willesden DO');
Execute aplus_macro('Wilmslow DO');
Execute aplus_macro('Wimbledon DO');
Execute aplus_macro('Wimborne DO');
Execute aplus_macro('Wincanton DO');
Execute aplus_macro('Winchester DO');
Execute aplus_macro('Winchmore Hill DO');
Execute aplus_macro('Windermere DO');
Execute aplus_macro('Winscombe DO');
Execute aplus_macro('Winsford DO');
Execute aplus_macro('Winterbourne DO');
Execute aplus_macro('Winton DO');
Execute aplus_macro('Wisbech DO');
Execute aplus_macro('Wishaw DO');
Execute aplus_macro('Witham DO');
Execute aplus_macro('Witney DO');
Execute aplus_macro('Woking DO');
Execute aplus_macro('Wokingham DO');
Execute aplus_macro('Wolverhampton DO');
Execute aplus_macro('Wolverhampton NE DO');
Execute aplus_macro('Wolverhampton NW DO');
Execute aplus_macro('Wombourne DO');
Execute aplus_macro('Wombwell DO');
Execute aplus_macro('Wood Green DO');
Execute aplus_macro('Woodbridge DO');
Execute aplus_macro('Woolton DO');
Execute aplus_macro('Woolwich DO');
Execute aplus_macro('Wootton Bassett DO');
Execute aplus_macro('Worcester City DO');
Execute aplus_macro('Worcester DO');
Execute aplus_macro('Worcester Park DO');
Execute aplus_macro('Workington DO');
Execute aplus_macro('Worksop DO');
Execute aplus_macro('Worthing DO');
Execute aplus_macro('Wotton Under Edge DO');
Execute aplus_macro('Wrexham DO');
Execute aplus_macro('WRT RDC Delivery');
Execute aplus_macro('Wymondham DO');
Execute aplus_macro('Wythenshawe DO');
Execute aplus_macro('Yate DO');
Execute aplus_macro('YDC RDC Delivery');
Execute aplus_macro('Yeovil DO');
Execute aplus_macro('York Central DO');
Execute aplus_macro('York Road DO');
Execute aplus_macro('York West DO');
Execute aplus_macro('Ystalyfera DO');
*/

----------------------------------------------


--CREATE MACRO sakd_rmgtt_ps2_macro(parameter1 DATE, parameter2 DATE, parameter3 VARCHAR(100))
--AS
--(
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
								where delivery_office = 'Cardiff North DO') vdaoh
		on vdaoh.address_id = vpa.address_id
	group by 1,2, 3, 4, 5, 6, 7, 8, 9;
--);
--Execute sakd_rmgtt_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-02-01', DATE '2016-02-28',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Cardiff North DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Cardiff North DO');

--Execute sakd_rmgtt_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-02-01', DATE '2016-02-28',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Slough DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Slough DO');

--Execute sakd_rmgtt_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-02-01', DATE '2016-02-28',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Burton on Trent DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Burton on Trent DO');

--Execute sakd_rmgtt_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-02-01', DATE '2016-02-28',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Cambridge DO');
--Execute sakd_rmgtt_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Cambridge DO');

--DROP MACRO sakd_rmgtt_ps2_macro;



---------------------------------------------------------




SELECT TOP 9999999 Er_Mpe_Id event_id, Location_Name_Rln do_name, Tracked_Event_Cd event_cd, User_Id user_id, Device_Id device_id,
event_dttm event_dttm,
scan_dttm scan_dttm,
route_id route_id,
Route_Walk_Num route_walk_num,
Scanlocation_Longitude longitude,
Scanlocation_Latitude latitude,
Delivery_Postcode postcode,
COALESCE(a.Unique_Item_ID, UPU_Tracking_Num, One_D_Barcode) barcode,
Delivery_Point_Postcode dp_postcode,
Delivery_Point dp
FROM EDW_SCVER_BO_VIEWS.v_base_mpe a
--LEFT OUTER
JOIN EDW_SCVER_CODA_ACCS_VIEWS.v_base_pre_adv_item_detail b ON a.Unique_Item_Id = b.Unique_Item_Id
INNER JOIN EDW_SCVER_BO_VIEWS.v_location l ON a.LOCATION_ID = l.LOCATION_ID
WHERE a.Tracked_Event_Cd LIKE 'EVK%'
AND a.Tracked_Event_Cd <>  'EVKLC'
AND a.Tracked_Event_Cd <>  'EVKLS'
--AND do_name = 'Cardiff North DO'
--AND do_name = 'Slough DO'
--AND do_name = 'Burton on Trent DO'
--AND do_name = 'Cambridge DO'
--AND CAST(CAST(Event_Dttm AS TIMESTAMP(0) FORMAT 'YYYY-MM-DDBHH:MI:SSZ')  AS DATE) BETWEEN '2016-01-01' AND '2016-08-31'
AND CAST(CAST(Event_Dttm AS TIMESTAMP(0) FORMAT 'YYYY-MM-DDBHH:MI:SSZ')  AS DATE) BETWEEN '2016-09-01' AND '2016-09-30';


---------------------------------------------------------------------


--CREATE MACRO sakd_tods_ps2_macro(parameter1 DATE, parameter2 DATE, parameter3 VARCHAR(100))
--AS
--(
	select top 9999999
vd.event_id event_id,
vd.event_actual_dttm event_dttm,
max(vbo.rm_event_code) event_cd,
max(vbo.latitude) latitude,
max(vbo.longitude) longitude,
max(vbo.full_barcode) barcode,
max(vpa.party_id) party_id,
max(vpa.address_id) address_id,
max(vda.postcode) postcode,
max(vda.delivery_point_suffix_val) delivery_point,
max(vdaoh.delivery_office) do_name
from (select * from EDW_SCVER_CODA_ACCS_VIEWS.v_delivery
			where (cast(event_actual_dttm as date) between DATE '2016-09-01' and DATE '2016-09-30' OR cast(event_actual_dttm as date) = DATE '2016-09-30')
			and source_system = 'TODS') vd
inner join (
	SELECT latitude, longitude, full_barcode, a.location_id, rm_event_code, event_id FROM EDW_SCVER_BO_VIEWS.v_bo_base_track_data_dtl a
	INNER JOIN (SELECT location_id FROM EDW_SCVER_BO_VIEWS.v_location WHERE Location_Name_Rln = 'Cardiff North DO') l ON a.LOCATION_ID = l.LOCATION_ID
	WHERE RM_Event_Code LIKE 'EVK%'
	AND RM_Event_Code <>  'EVKLC'
	AND RM_Event_Code <> 'EVKLS') vbo
		on vbo.event_id = vd.event_id
inner join (select * from EDW_SCVER_CODA_ACCS_VIEWS.v_event_party
					where (event_actual_dt between DATE '2016-09-01' and DATE '2016-09-30' or event_actual_dt = DATE '2016-09-30')
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
							where delivery_office = 'Cardiff North DO') vdaoh
	on vdaoh.address_id = vpa.address_id
group by 1,2;
 


--Execute sakd_tods_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-02-01', DATE '2016-02-29',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Cardiff North DO');
--Execute sakd_tods_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Cardiff North DO');

--Execute sakd_tods_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-02-01', DATE '2016-02-29',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Slough DO');
--Execute sakd_tods_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Slough DO');

--Execute sakd_tods_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-02-01', DATE '2016-02-29',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Burton on Trent DO');
--Execute sakd_tods_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Burton on Trent DO');

--Execute sakd_tods_ps2_macro(DATE '2016-01-01', DATE '2016-01-31',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-02-01', DATE '2016-02-29',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-03-01', DATE '2016-03-31',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-04-01', DATE '2016-04-30',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-05-01', DATE '2016-05-31',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-06-01', DATE '2016-06-30',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-07-01', DATE '2016-07-31',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-08-01', DATE '2016-08-31',  'Cambridge DO');
--Execute sakd_tods_ps2_macro(DATE '2016-09-01', DATE '2016-09-30',  'Cambridge DO');

--DROP MACRO sakd_tods_ps2_macro;