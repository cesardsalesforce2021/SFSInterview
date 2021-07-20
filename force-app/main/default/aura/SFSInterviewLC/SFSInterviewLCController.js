({
    init : function(component, event, helper) 
    {
        console.log("Init");
        helper.fetchData(component, event);
    },
    AddDebt : function(component, event, helper) 
    {
        console.log("AddDebt");
        helper.AddDebt(component, event) ;
    },
    RemoveDebt : function(component, event, helper) 
    {
        console.log("RemoveDebt");
        helper.RemoveDebt(component, event) ;
    },
    onrowselection: function(component, event, helper) 
    {
        console.log("onrowselection");
        helper.onrowselection(component, event) ;
    },
    handleRowAction: function (cmp, event, helper) 
    {
        var action = event.getParam('action');
        var row = event.getParam('row');
        helper.removeRow(cmp, row);
             
    }
    
})