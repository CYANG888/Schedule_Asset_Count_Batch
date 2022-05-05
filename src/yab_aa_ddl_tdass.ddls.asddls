@AbapCatalog.sqlViewName: 'YAB_AA_CDS_TDASS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Time Dependent Asset Allocations'
define view YAB_AA_DDL_TDASS as select from anlz {
    key bukrs as company_code,
    key anln1 as asset_number,
    key anln2 as asset_subnumber,
    key bdatu as valid_to,
    kostl as cost_center,
    werks as plant,
    stort as location,
    fkber as functional_area
} where bdatu = '99991231'
