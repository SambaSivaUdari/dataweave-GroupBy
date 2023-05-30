%dw 2.0
output application/json
---
payload groupBy ((item, index) -> item.invoiceId) 
pluck ((value, key, index) -> {
 "Invoiceid" : (key),
 "vendorName": value.vendorName[index],
    "total":    value.total[index],
 "Linteitem" : value map ((item, index) -> {
    "item" : item.lineItem,
    "amount" : item.lineItemAmount
} ) })