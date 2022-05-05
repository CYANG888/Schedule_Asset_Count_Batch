@AbapCatalog.sqlViewName: 'YAB_AA_CDS_ZZTAG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Asset Tag Indicator'

define view YAB_AA_DDL_ASSET_TAG
  as select from dd07t
{
  key domvalue_l as AssetTagIndicatorVal,
      ddtext     as AssetTagIndicatorText
}
where
      domname    = 'YAB_DO_ZZTAG'
  and ddlanguage = $session.system_language
  and as4local   = 'A'
