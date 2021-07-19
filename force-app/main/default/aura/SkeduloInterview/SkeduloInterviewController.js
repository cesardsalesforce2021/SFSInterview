({
    init : function(component, event, helper) 
    {
        console.log("Init");
        helper.fetchData(component, event);
    },
    
    handleRowAction: function (cmp, event, helper) 
    {
        var action = event.getParam('action');
        var row = event.getParam('row');
        

		switch (action.name) 
		{
			case "EditRecord":
			  console.log("EditRecord: " + JSON.stringify(row));
			  helper.OpenModal1(cmp,row);
			  break;
			case "DeleteRecord":
			  console.log("DeleteRecord: " + JSON.stringify(row));
			  helper.deleteRecord(cmp);
			  break;
		}
             
    },
	CloseModal: function (cmp)
    {
		cmp.set("v.isOpen", false);
	},
	OpenModal: function (cmp, event, helper) 
    {
		helper.OpenModal(cmp);
	},
	
    
})