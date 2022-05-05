@AbapCatalog.sqlViewName: 'YAB_AA_CDS_MRSEG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Asset Master Record Segment'
@Metadata.allowExtensions: true
@ObjectModel.resultSet.sizeCategory: #XS

define view YAB_AA_DDL_MRSEGMENT
  as select from anla
  association [0..1] to YAB_AA_DDL_TDASS        as _time_dependent_ass on  $projection.asset_number    = _time_dependent_ass.asset_number
                                                                       and $projection.company_code    = _time_dependent_ass.company_code
                                                                       and $projection.asset_subnumber = _time_dependent_ass.asset_subnumber
  association [0..1] to YAB_AA_DDL_ASSMR        as _ass_master_record  on  $projection.asset_number    = _ass_master_record.asset_number
                                                                       and $projection.company_code    = _ass_master_record.company_code
                                                                       and $projection.asset_subnumber = _ass_master_record.asset_subnumber
  association [1..1] to YAB_AA_DDL_Custom_table as _custom_table       on  $projection.asset_number    = _custom_table.asset_number
                                                                       and $projection.company_code    = _custom_table.company_code
                                                                       and $projection.asset_subnumber = _custom_table.sub_number
  association [0..1] to YAB_AA_DDL_USER_ID      as _user_id            on  $projection.user_id = _user_id.UserName
  association [0..1] to I_CompanyCodeAssetStdVH as _company_code       on  $projection.company_code = _company_code.CompanyCode
  association [0..1] to I_AssetClassStdVH       as _asset_class        on  $projection.asset_class = _asset_class.AssetClass
  association [0..1] to I_CostCenter            as _cost_center        on  $projection.cost_center = _cost_center.CostCenter
  association [0..1] to I_PlantStdVH            as _plant              on  $projection.plant = _plant.Plant
  association [0..1] to YAB_AA_DDL_LOCATION     as _location           on  $projection.location = _location.Location
  association [0..1] to YAB_AA_DDL_ASSET_NUMBER as _asset_number       on  $projection.asset_number = _asset_number.AssetNumber
  association [0..1] to YAB_AA_DDL_ASSET_TAG    as _asset_tag          on  $projection.asset_tag_indicator = _asset_tag.AssetTagIndicatorVal
{
  key anln1                               as asset_number,
  key bukrs                               as company_code,
  key anln2                               as asset_subnumber,
      anlkl                               as asset_class,
      txt50                               as asset_description,
      sernr                               as serial_number,
      invnr                               as inventory_number,
      invzu                               as inventory_note,
      deakt                               as deactivation_on,
      erdat                               as asset_created_date,
      ivdat                               as last_inventory_date,
      aktiv                               as capitalized_date,

      /*Associations*/
      _time_dependent_ass.valid_to        as valid_to,
      _time_dependent_ass.cost_center     as cost_center,
      _time_dependent_ass.plant           as plant,
      _time_dependent_ass.location        as location,

      case
      when _ass_master_record.asset_tag_indicator = 'Y' then 'Y'
      when _ass_master_record.asset_tag_indicator = 'N' then 'N'
      else '' end                         as asset_tag_indicator,
      _time_dependent_ass.functional_area as functional_area,
      _user_id.UserName                   as user_id,
      _custom_table.batch_status          as batch_status,
      _custom_table.batch_no              as batch_no,

      _ass_master_record,
      _custom_table,
      _company_code,
      _asset_class,
      _cost_center,
      _plant,
      _location,
      _user_id,
      _asset_tag,
      _asset_number
}
