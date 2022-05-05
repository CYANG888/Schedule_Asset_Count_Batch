@AbapCatalog.sqlViewName: 'YAB_AA_CDS_BSTAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Batch Status Data Definition'
define view YAB_AA_DDL_Batch_status as select from yab_aa_cbatch {
    key asset_number, 
    key asset_class,
    key company_code,
    key sub_number,
    max(batch_no) as batch_no,
    batch_status as batch_status
}
        group by asset_number, asset_class, company_code, sub_number, batch_status
        
