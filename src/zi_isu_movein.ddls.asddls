@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Move-In App'

define root view entity ZI_ISU_MoveIn
  as select from zisu_cont_bmd as Contract
  
  association [1..1] to zisu_equip_tmd as _Equipment on $projection.EquipId = _Equipment.equip_id
{
    key Contract.contract_id as ContractId,
    Contract.customer_name   as CustomerName,
    Contract.move_in_date    as MoveInDate,
    Contract.status          as Status,
    Contract.equip_id        as EquipId,
    
    @Semantics.user.createdBy: true
    Contract.created_by      as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    Contract.created_at      as CreatedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    Contract.changed_at      as ChangedAt,

    _Equipment
}
