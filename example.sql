-- retrieve the coordinates for $rncpanel features for a given chart
-- Usage: @get_rncpanel_coords.sql chartnumber 

set serveroutput on size 1000000;
set verify off
set feedback off

define chartnumber = &1

select LLDG_geom from feature_geometry_vw
where rep_id = (
	select rep_id from panel_feature_vw
	where object_acronym = '$rncpanel'
	and panelver_id = (
		select panelver_id from CHART_SHEET_PANEL_VW
		WHERE chartver_id = (
			select chartver_id from CHART_ATTRIBUTES_VIEW
			WHERE acronym = 'CHTNUM' and stringval = '&chartnumber')));


Use case:
How to get the geometry of the $rncpanel features for a given chart/panel?

View: CHART_ATTRIBUTES_VIEW
get the chartver_id using the chart number
ex:
select chartver_id from CHART_ATTRIBUTES_VIEW
WHERE acronym = 'CHTNUM' and stringval = '4905';


chart number =4905
ID = 13
panelver_id = 14005
rep_id = 84152
foid = QQ 0000071224 00001


View: CHART_SHEET_PANEL_VW
Columns:
	chartver_id
	sheetver_id
	panelver_id
ex:
select panelver_id from CHART_SHEET_PANEL_VW
WHERE chartver_id = '13';



View:  PANEL_FEATURE_VW
Columns of interest:  
	panelver_id   (See above queries)
	object_acronym   ($rncpanel)
	rep_id   (need this to extract its geom from another table. See below)
ex:
select rep_id from panel_feature_vw
where object_acronym = '$rncpanel'
and panelver_id = '14005';



View: FEATURE_GEOMETRY_VW
Columns of interest:
	rep_id
	LLDG_geom
	branch_geom   (for those features created after 4, refer to the p_feature_api.getBranchgeometry function)
ex:
select LLDG_geom from feature_geometry_vw
where rep_id = '84152';


Function: P_FEATURE_API.getBranchGeometry	
Input: v_rep_id     (spatial representation id)
Output: SDO_GEOMETRY    (geometry for the line/area feature)


Putting it all together:

select LLDG_geom from feature_geometry_vw
where rep_id = (
	select rep_id from panel_feature_vw
	where object_acronym = '$rncpanel'
	and panelver_id = (
		select panelver_id from CHART_SHEET_PANEL_VW
		WHERE chartver_id = (
			select chartver_id from CHART_ATTRIBUTES_VIEW
			WHERE acronym = 'CHTNUM' and stringval = '4905')));

