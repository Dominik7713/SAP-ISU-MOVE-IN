@EndUserText.label: 'View for Move-In App'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZC_ISU_MOVEIN
  provider contract transactional_query
  as projection on ZI_ISU_MoveIn
{
    key ContractId,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    CustomerName,
    
    MoveInDate,
    
    @Search.defaultSearchElement: true
    Status,
    
    @Search.defaultSearchElement: true
    EquipId,
    
    CreatedBy,
    CreatedAt,
    ChangedAt,
    
    @Search.defaultSearchElement: true
    _Equipment.city as EquipCity,
    
    _Equipment.street as EquipStreet,
    _Equipment.meter_reading as EquipReading,
    _Equipment.uom as EquipUOM,

    _Equipment
}
