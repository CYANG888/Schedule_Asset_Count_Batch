@AbapCatalog.sqlViewName: 'YAB_AA_CDS_ASSMR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Asset Master Record'
define view YAB_AA_DDL_ASSMR as select from anlu {
    key bukrs as company_code,
    key anln1 as asset_number,
    key anln2 as asset_subnumber,
    zztag as asset_tag_indicator

}
