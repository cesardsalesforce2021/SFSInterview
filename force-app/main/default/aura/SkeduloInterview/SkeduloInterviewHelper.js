({
    fetchData: function (cmp, event) 
	{
		console.log("Init: FetchData");

		var action = cmp.get("c.GetDataBackEnd");
		var actions = [
            
			{ label: 'Edit', name: 'EditRecord' },
			{ label: 'Delete', name: 'DeleteRecord' },
        ];

        var columns = [
			
			{ label: "Name", fieldName: "Name", type: "text" },
			{ label: "Actions", fieldName: "Actions__c", type: "text" },
			{ label: "Status", fieldName: "Status__c", type: "text" },
			{ type: 'action', typeAttributes: { rowActions: actions } },
			
		];
		cmp.set("v.Columns", columns);

		action.setCallback(this, function(response)
		{
			var state = response.getState();
            
			
			if (state === "SUCCESS") 
			{
				var dataRaw = response.getReturnValue();
				cmp.set("v.lstData", dataRaw);
				
			}
			else
			{
				console.log('response2 :'+response);
				console.log('state :'+state);
				console.log('response.getError()[0].exceptionType :'+response.getError()[0].exceptionType);
				console.log('response.getError()[0].message :'+response.getError()[0].message );
				console.log('response.getError()[0].stackTrace :'+response.getError()[0].stackTrace);
			}
			
        });
        $A.enqueueAction(action);
        console.log('End: ContractComparedResult_ctrl');
	},
	OpenModal: function (cmp)
    {
		cmp.set("v.isOpen", true);
	},
	OpenModal1: function (cmp,row)
    {
		cmp.set("v.isOpen", true);
	},
	deleteRecord: function (cmp)
    {
		window.alert("Record Deleted");

		//Call the controler
	},
	CloseModal: function (cmp)
    {
		cmp.set("v.isOpen", false);
	},
	
})