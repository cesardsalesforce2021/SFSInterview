({
    fetchData: function (cmp, event) 
	{
		console.log("Init: FetchData");

		var action = cmp.get("c.GetDataBackEnd");


        var columns = [
			
			{ label: "Creditor", fieldName: "creditorName", type: "text" },
			{ label: "First Name", fieldName: "firstName", type: "text" },
			{ label: "Last Name", fieldName: "lastName", type: "text" },
			{ label: "Min Pay %", fieldName: "minPaymentPercentage", type: "percentage" },
			{ label: "Balance", fieldName: "balance", type: "currency" },
			
			
		];
		cmp.set("v.Columns", columns);

		action.setCallback(this, function(response)
		{
			var state = response.getState();
            
			
			if (state === "SUCCESS") 
			{
				var dataRaw = response.getReturnValue();
				cmp.set("v.lstData", dataRaw);
				cmp.set("v.TotalRowCount", dataRaw.length);
				
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
	AddDebt: function (cmp, event) 
	{
		console.log('AddDebt Helper');
		console.log(''+cmp.get("v.lstData"));
		var data=JSON.parse(JSON.stringify(cmp.get("v.lstData")));
		var newRow1 = [
			
			{ balance: "", creditorName: "", firstName: "" , id: data[data.length-1].id+1, lastName: "", minPaymentPercentage: ""},
			
		];
		data.push(newRow1);
		cmp.set("v.lstData", data);
		cmp.set("v.TotalRowCount", data.length);
	},
	RemoveDebt: function (cmp, event) 
	{
		console.log('AddDebt Helper');
		console.log(''+cmp.get("v.lstData"));
		var data=JSON.parse(JSON.stringify(cmp.get("v.lstData")));
		data.splice(data.length-1, 1);
		cmp.set("v.lstData", data);
		cmp.set("v.TotalRowCount", data.length);
	},
	onrowselection: function (cmp, event) 
	{
		var selectedRows = event.getParam('selectedRows');
		
		cmp.set("v.CheckRowCount", selectedRows.length);
		
		this.addSummaryRow(cmp,selectedRows);
	},

	addSummaryRow: function (cmp,selectedRows) 
	{
		
		var totalBalance=0;
		for (var i = 0; i < selectedRows.length; i++){
            totalBalance=totalBalance+selectedRows[i].balance;
        }
		cmp.set("v.totalBalance", totalBalance);
	},
	removeRow: function (cmp, row) {
        var rows = cmp.get('v.data');
        var rowIndex = rows.indexOf(row);

        rows.splice(rowIndex, 1);
        cmp.set('v.lstData', rows);
    }
})