@AbapCatalog.sqlViewName: 'YAB_AA_CDS_LOCAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Location Data Definition'
@Search.searchable: true

define view YAB_AA_DDL_LOCATION as select from t499s as loc{
    @Search: {defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.8}  
      @ObjectModel.text.element: 'LocationName'
  key loc.stand   as Location,
      @ObjectModel.foreignKey.association: '_Plant'
  key loc.werks   as Plant,
      @ObjectModel.foreignKey.association: '_Address'
      loc.addrnum as AddressID,
      @Semantics.text: true
      cast(loc.ktext as locationname preserving type) as LocationName
}
