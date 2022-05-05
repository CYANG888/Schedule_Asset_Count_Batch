@AbapCatalog.sqlViewName: 'YAB_AA_CDS_USRID'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'User ID View'
define view YAB_AA_DDL_USER_ID as select from usr21 
association [1..1] to adrp as _person_address on $projection.PersonNumber = _person_address.persnumber{
    key bname as UserName,
    persnumber as PersonNumber,
    _person_address.name_text as FullName
}
