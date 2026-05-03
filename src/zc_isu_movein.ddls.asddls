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
    CustomerName,
    
    MoveInDate,
    
    Status,
    
    @Search.defaultSearchElement: true
    EquipId,
    
    CreatedBy,
    CreatedAt,
    ChangedAt,

    _Equipment 
}
