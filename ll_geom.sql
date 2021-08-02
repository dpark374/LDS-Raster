select LLDG_geom from feature_geometry_vw
where rep_id = (
select rep_id from panel_feature_vw
where object_acronym = '$rncpanel'
and panelver_id in (
select panelver_id from CHART_SHEET_PANEL_VW
WHERE chartver_id = (
select chartver_id from CHART_ATTRIBUTES_VIEW
WHERE acronym = 'CHTNUM' and stringval = 'NZ24'))) and object_type ='Line';






select LLDG_geom from feature_geometry_vw
where rep_id = (
	select rep_id from panel_feature_vw
	where object_acronym = '$rncpanel'
	and panelver_id = (
		select panelver_id from CHART_SHEET_PANEL_VW
		WHERE chartver_id = (
			select chartver_id from CHART_ATTRIBUTES_VIEW
			WHERE acronym = 'CHTNUM' and stringval = 'NZ24'))) ;
            
            
            
            
select chartver_id from CHART_ATTRIBUTES_VIEW WHERE acronym = 'CHTNUM' and stringval = 'NZ24';
select panelver_id from CHART_SHEET_PANEL_VW WHERE chartver_id ='2001';
select rep_id from panel_feature_vw where object_acronym = '$rncpanel' and panelver_id in (6387,6389,6544);
select * from feature_geometry_vw where rep_id = 83241356;



select * from feature_geometry_vw where object_type = 'Line';

select * from CHART_SHEET_PANEL_VW;

select pa1.chartver_id, pa2.panelver_id, pa3.rep_id, pa4.lldg_geom  from CHART_ATTRIBUTES_VIEW pa1, CHART_SHEET_PANEL_VW pa2, panel_feature_vw pa3, feature_geometry_vw pa4  
where pa1.acronym = 'CHTNUM' and pa2.product_status = 'Active' 
and pa1.chartver_id = pa2.chartver_id
and pa3.panelver_id = pa2.panelver_id
and pa3.object_acronym = '$rncpanel'
and pa4.rep_id = pa3.rep_id;


CREATE TABLE LLDG_GEOM_TEST AS
select pa1.stringval ,pa1.chartver_id, pa2.panelver_id, pa3.rep_id, pa4.lldg_geom  from CHART_ATTRIBUTES_VIEW pa1, CHART_SHEET_PANEL_VW pa2, panel_feature_vw pa3, feature_geometry_vw pa4  
where pa1.acronym = 'CHTNUM' and pa2.product_status = 'Active' 
and pa1.chartver_id = pa2.chartver_id
and pa3.panelver_id = pa2.panelver_id
and pa3.object_acronym = '$rncpanel'
and pa4.rep_id = pa3.rep_id;