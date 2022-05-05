@AbapCatalog.sqlViewName: 'YAB_AA_CDS_CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Custom table ZASSET_CBATCH View'
@ObjectModel: {createEnabled: true}
define view YAB_AA_DDL_Custom_table as select from yab_aa_cbatch {

    key company_code,
    key batch_no,
    key asset_class,
    key asset_number,
    key sub_number,
    batch_status,
    user_id ,
    target_date_completion,
    
    last_inventory_date,
    crtd_by,
    crtd_date,
    changed_by,
    changed_date,
    completion_status,
    remarks

   
}    
        
       
