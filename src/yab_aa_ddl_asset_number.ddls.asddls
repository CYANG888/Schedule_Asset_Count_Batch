@AbapCatalog.sqlViewName: 'YAB_AA_CDS_ASSNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Asset Number'

define view YAB_AA_DDL_ASSET_NUMBER
  as select from anlh
{
  key anln1   as AssetNumber,
      anlhtxt as asset_description
}
