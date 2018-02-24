-- TABLE: "POLITICAL_JURISDICTION" 

SELECT jursd_cd,
      CASE
        WHEN city_cd IS NOT NULL THEN 'city'
        ELSE 'No City'
      END          AS jursd_typ_cd,
      city_strd_nm AS POLTCL_JURSDN_NM,
      city_eff_dt  AS POLTCL_JURSDN_EFF_DT,
      city_exp_dt  AS POLTCL_JURSDN_EXP_DT
FROM   (SELECT DISTINCT c.city_cd,
                       j.jursd_cd,
                       c.city_strd_nm,
                       c.city_eff_dt,
                       c.city_exp_dt
       FROM   arc_edw.city c
              join arc_edw.jursd j
                ON c.jursd_cd = j.jursd_cd) where jursd_cd is not null and ltrim(rtrim(jursd_cd)) <> ''
UNION
SELECT jursd_cd,
      CASE
        WHEN cntry_cd IS NOT NULL THEN 'country'
        ELSE 'No Country'
      END          AS jursd_typ_cd,
      cntry_nm     AS POLTCL_JURSDN_NM,
      cntry_eff_dt AS POLTCL_JURSDN_EFF_DT,
      cntry_exp_dt AS POLTCL_JURSDN_EXP_DT
FROM   (SELECT DISTINCT j.jursd_cd,
                       c1.cntry_cd,
                       c1.cntry_nm,
                       c1.cntry_eff_dt,
                       c1.cntry_exp_dt
       FROM   arc_edw.cntry c1
              join arc_edw.jursd j
                ON c1.cntry_cd = j.cntry_cd) where jursd_cd is not null and ltrim(rtrim(jursd_cd)) <> ''

-- TABLE: "PARTY" 

-- MAPPING NOT AVAILABLE TO LOAD PARTY

-- TABLE: "CARRIER" 

select distinct CARR_CD,CARR_NBR AS CARR_ACCTG_CD,CARR_CHK_DGT AS CARR_ACCTG_CHK_DGT_NBR,CARR_EFF_DT,CARR_EXP_DT,TRNSPT_MODE_CD AS CARR_TYPE_CD from arc_edw.carrier WHERE 
CARR_CD is not null AND LTRIM(RTRIM(CARR_CD))<>''

-- TABLE: "GEOGRAPHIC_LOCATION"

select distinct a.ARPT_STRD_NM AS GEOGPHC_LOCN_NM,a.LAT_DEG AS GEOGPHC_LOCN_LAT_DEG,a.LAT_MIN AS GEOGPHC_LOCN_LAT_MIN,a.LAT_SEC AS GEOGPHC_LOCN_LAT_SEC,a.LONG_DEG AS GEOGPHC_LOCN_LONG_DEG,a.LONG_MIN AS GEOGPHC_LOCN_LONG_MIN,a.LONG_SEC AS GEOGPHC_LOCN_LONG_SEC from arc_edw.airport a
join
arc_edw.city b
on a.city_cd = b.city_cd where a.ARPT_STRD_NM is not null AND LTRIM(RTRIM(a.ARPT_STRD_NM))<>''

-- TABLE: "CHARGE_TYPE" 
--MAPPING NOT AVAILABLE TO LOAD PARTY

-- TABLE: "CURRENCY_TYPE" 
--MAPPING NOT AVAILABLE TO LOAD PARTY

-- TABLE: "GEOGRAPHIC_BOUNDARY" 

select distinct SUBZNE1_CD as GEOGPHC_BNDRY_CD, SUBZNE1_NM as GEOGPHC_BNDRY_NM from arc_edw.SUBZNE_ONE WHERE GEOGPHC_BNDRY_CD IS NOT NULL AND LTRIM(RTRIM(GEOGPHC_BNDRY_CD))<>''

-- TABLE: "GEOGRAPHIC_BOUNDARY_GEOGRAPHIC_LOCATION" 

select distinct GEOGPHC_BNDRY_CD from ( select subzne1_cd as GEOGPHC_BNDRY_CD from arc_edw.CITY
union 
select subzne2_cd from arc_edw.CITY ) WHERE GEOGPHC_BNDRY_CD IS NOT NULL AND LTRIM(RTRIM(GEOGPHC_BNDRY_CD))<>''

-- 
-- TABLE: "GEOGRAPHIC_BOUNDARY_POLITICAL_JURISDICTION" 

--MAPPING NOT AVAILABLE TO LOAD GEOGRAPHIC_BOUNDARY_POLITICAL_JURISDICTION

-- 
-- TABLE: "GEOGRAPHIC_BOUNDARY_TRANSPORTATION_LOCATION" 

select distinct GEOGPHC_BNDRY_CD from ( 
select distinct subzne1_cd as GEOGPHC_BNDRY_CD from arc_edw.airport
union
select distinct subzne2_cd as GEOGPHC_BNDRY_CD from arc_edw.airport
union
select distinct world_area_cd as GEOGPHC_BNDRY_CD from arc_edw.airport
)
where GEOGPHC_BNDRY_CD IS NOT NULL AND LTRIM(RTRIM(GEOGPHC_BNDRY_CD))<>''

-- TABLE: "ORGANIZATION_NAME"

select distinct ORG_NM_TXT from ( 
select distinct BUS_NAME as ORG_NM_TXT from arc_edw.AGTN
union
select distinct CARR_NM as ORG_NM_TXT from arc_edw.CARRIER
)
where ORG_NM_TXT IS NOT NULL AND LTRIM(RTRIM(ORG_NM_TXT))<>''

 
-- TABLE: "PARTY_GROUP" 

--MAPPING NOT AVAILABLE TO LOAD PARTY_GROUP

-- TABLE: "PARTY_GROUP_MEMBER"

--MAPPING NOT AVAILABLE TO LOAD PARTY_GROUP_MEMBER

-- TABLE: "POLITICAL_JURISDICTION_GEOGRAPHIC_LOCATION" 

--MAPPING NOT AVAILABLE TO LOAD PARTY_GROUP_MEMBER

-- TABLE: "POLITICAL_JURISDICTION_TRANSPORTATION_LOCATION" 

select EFF_DT as POLTCL_JURSDN_TRNSPTN_LOCN_EFF_DT, EXPRN_DT as POLTCL_JURSDN_TRNSPTN_LOCN_EXP_DT, GRP_NM as POLTCL_JURSDN_CD from arc_edw.STN_GRPNG
where POLTCL_JURSDN_CD is not null AND LTRIM(RTRIM(POLTCL_JURSDN_CD))<>'' or POLTCL_JURSDN_TRNSPTN_LOCN_EFF_DT is not null AND LTRIM(RTRIM(POLTCL_JURSDN_TRNSPTN_LOCN_EFF_DT))<>''
or POLTCL_JURSDN_TRNSPTN_LOCN_EXP_DT is not null AND LTRIM(RTRIM(POLTCL_JURSDN_TRNSPTN_LOCN_EXP_DT))<>''

-- TABLE: "SCHEDULED_TRANSPORTATION" 

select distinct FLT_NBR as SCHEDD_TRNSPTN_NBR, flt_eff_from_dt as SCHEDD_TRNSPTN_EFF_DT, flt_eff_from_dt as SCHEDD_TRNSPTN_EXP_DT,
NBR_OF_STP as SCHEDD_TRNSPTN_STPOVR_CNT, FLT_SVC_TYP as CARR_SVC_TYPE_CD, MRKT_CARR_CD as CARR_MKTG_CD
from arc_edw.flt_schdl where SCHEDD_TRNSPTN_NBR is not null and LTRIM(RTRIM(SCHEDD_TRNSPTN_NBR))<>'' and SCHEDD_TRNSPTN_EFF_DT is not null and LTRIM(RTRIM(SCHEDD_TRNSPTN_EFF_DT))<>''

-- TABLE: "SCHEDULED_TRANSPORTATION_SEGMENT"



