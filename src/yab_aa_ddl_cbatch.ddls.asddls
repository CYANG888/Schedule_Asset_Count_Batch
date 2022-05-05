@AbapCatalog.sqlViewName: 'YAB_AA_CDS_BATCH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Asset Schedule Count Batch'
@Metadata.allowExtensions: true
@ObjectModel.resultSet.sizeCategory: #XS

define view YAB_AA_DDL_CBATCH
  as select from YAB_AA_DDL_MRSEGMENT 
 
{
      @EndUserText.label: 'Asset Number'
      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'AssetNumber', name:'YAB_AA_DDL_ASSET_NUMBER'} }]}
  key asset_number,
      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'CompanyCode', name:'I_CompanyCodeAssetStdVH'} }],
                    filter:{mandatory: true, selectionType: #SINGLE}}
  key company_code,
      @EndUserText.label: 'Sub Number'
  key asset_subnumber,
      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'AssetClass', name:'I_AssetClassStdVH' } }],
                    filter:{selectionType: #SINGLE}}
      asset_class,
      asset_description,
      serial_number,
      inventory_number,
      inventory_note,
      deactivation_on,
      asset_created_date,
      last_inventory_date,
      capitalized_date,

      valid_to,

      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'CostCenter', name:'I_CostCenter' } }],
                    filter:{selectionType: #SINGLE}}
      cost_center,

      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'Plant', name:'I_PlantStdVH' } }],
                    filter:{selectionType: #SINGLE}}
      plant,

      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'Location', name:'YAB_AA_DDL_LOCATION' } }],
                    filter:{selectionType: #SINGLE}}
      location,

      @Consumption:{valueHelpDefinition: [{ entity:{ element: 'AssetTagIndicatorVal', name:'YAB_AA_DDL_ASSET_TAG' } }]}     
      asset_tag_indicator,
      functional_area,
      user_id,
      batch_status,
      batch_no,
      _user_id,
      _asset_tag,
      _ass_master_record,
      _custom_table,
      _company_code,
      _asset_class,
      _cost_center,
      _plant,
      _location,
      _asset_number
}

where
     batch_status is null   //Asset not counted
  or batch_status = 'C'     //Asset is counted
  
