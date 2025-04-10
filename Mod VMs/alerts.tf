resource "azurerm_monitor_action_group" "email_alert" {
  name                = "email-alert"
  resource_group_name = azurerm_resource_group.app_grp.name
  short_name          = "email-alert"

   email_receiver {
    name                    = "sendtoAdmin"
    email_address           = "nupur.kotrange@prorigosoftware.com"
    use_common_alert_schema = true
  }

}
resource "azurerm_monitor_metric_alert" "Network_Threshold_alert" {
  name                = "Network-Threshold-alert"
  resource_group_name = azurerm_resource_group.app_grp.name
  scopes              = [azurerm_windows_virtual_machine.app_vm.id]
  description         = "The alert will be sent if the Network Out bytes exceeds 70 bytes"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Network Out Total"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 70    
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_alert.id
  }

  depends_on = [
    azurerm_windows_virtual_machine.app_vm,
    azurerm_monitor_metric_alert.email_alert
  ]
}